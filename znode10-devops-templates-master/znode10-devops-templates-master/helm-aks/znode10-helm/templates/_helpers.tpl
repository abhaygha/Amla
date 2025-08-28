{{/* DRY Setup for deployment files */}}
{{- define "znode10.microservice.deployment" -}}
{{- $name := .name }}
{{- $svc := index $.Values.resources $name }}
{{- if and (or (not (hasKey $svc "enableService")) ($svc.enableService)) (or (hasKey .image "tag") (hasKey $.Values.global "imageTag")) }}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ $name }}
  namespace: {{ $.Release.Namespace }}
  labels:
    app: {{ $name }}
    service: {{ $name }}
spec:
  replicas: {{ .replicaCount | default 1 }}
  selector:
    matchLabels:
      service: {{ $name }}
  template:
    metadata:
      labels:
        app: {{ $name }}
        service: {{ $name }}
      annotations:
        checksum/configmap: {{ toYaml .configmap | sha256sum }}
    spec:
{{- if eq .Values.global.clusterType "aks" }}
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: agentpool
                    operator: In
                    values:
                      - znode10upl
                      - znode10apl
{{- end }}

      terminationGracePeriodSeconds: 120

{{- $storages := (kindIs "slice" $svc.storage) | ternary $svc.storage (list $svc.storage) }}

{{- $storages := (kindIs "slice" $svc.storage) | ternary $svc.storage (list $svc.storage) }}
{{- $hasEnabledStorage := false }}
{{- range $vol := $storages }}
  {{- if and $vol (hasKey $vol "enabled") $vol.enabled }}
    {{- $hasEnabledStorage = true }}
  {{- end }}
{{- end }}

{{- if or
      $hasEnabledStorage
      (and (eq $name "znode10xpluginserver") (eq $.Values.global.tenant "z10") (eq $.Values.global.environment "qa"))
      (and (or (eq $name "znode10xapi") (eq $name "znode10xcustomtable") (eq $name "znode10xadmin")) (eq $.Values.global.environment "dev2"))
}}
      volumes:
{{- range $vol := $storages }}
{{- if and $vol (hasKey $vol "enabled") $vol.enabled }}
        - name: {{ $name }}-{{ $vol.name | default "storage" }}
          persistentVolumeClaim:
            claimName: {{ $name }}-{{ $vol.name | default "storage" }}-pvc
{{- end }}
{{- end }}
{{- if and (eq $name "znode10xpluginserver") (eq $.Values.global.tenant "z10") (eq $.Values.global.environment "qa") }}
        - name: plugin-server-storage
          persistentVolumeClaim:
            claimName: znode10-plugin-server-pvc
{{- end }}
{{- if and (or (eq $name "znode10xapi") (eq $name "znode10xcustomtable") (eq $name "znode10xadmin")) (eq $.Values.global.environment "dev2") }}
        - name: media-storage
          persistentVolumeClaim:
            claimName: znode10xmedia-pvc
{{- end }}
{{- end }}

      containers:
        - name: {{ $name }}
{{- $useTenant := or (eq $name "znode10xwebstore") (eq $name "znode10xpagebuilder") (eq $name "znode10customapi") }}
{{- $imageRegistry := ternary $.Values.global.tenantacr.imageRegistry $.Values.global.imageRegistry $useTenant }}
          image: "{{ $imageRegistry }}/{{ .image.name }}:{{ .image.tag }}"
          imagePullPolicy: {{ .image.pullPolicy | default "Always" }}
          lifecycle:
            preStop:
              exec:
                command: [ "/bin/sh", "-c", "sleep 100" ]
          envFrom:
            - configMapRef:
                name: {{ $name }}-configmap

          volumeMounts:
{{- range $vol := $storages }}
{{- if and $vol (hasKey $vol "enabled") $vol.enabled }}
            - name: {{ $name }}-{{ $vol.name | default "storage" }}
              mountPath: {{ $vol.mountPath | quote }}
              {{- if hasKey $vol "readOnly" }}
              readOnly: {{ $vol.readOnly }}
              {{- end }}
{{- end }}
{{- end }}
{{- if and (eq $name "znode10xpluginserver") (eq $.Values.global.tenant "z10") (eq $.Values.global.environment "qa") }}
            - name: plugin-server-storage
              mountPath: /app/Plugins
{{- end }}
{{- if and (or (eq $name "znode10xapi") (eq $name "znode10xcustomtable") (eq $name "znode10xadmin")) (eq $.Values.global.environment "dev2") }}
            - name: media-storage
              mountPath: /app/Data/storage/
{{- end }}
{{- $resources := include "znode10.resources" . }}
{{- if $resources }}
{{ $resources | indent 10 }}
{{- end }}
{{- if and (or (eq $name "znode10xadmin") (eq $name "znode10xapi") (eq $name "znode10xapiv2") (eq $name "znode10xpaymentmanager") (eq $name "znode10xapicp") (eq $name "znode10xapigateways") (eq $name "znode10xshippingmanager")) (hasKey $.Values.global "probes") }}
          readinessProbe:
            httpGet:
              path: /health
              port: 80
              scheme: HTTP
            initialDelaySeconds: {{ $.Values.global.probes.readiness.delay | default 60 }}
            periodSeconds: {{ $.Values.global.probes.readiness.period | default 5 }}
            timeoutSeconds: {{ $.Values.global.probes.readiness.timeout | default 3 }}
            failureThreshold: {{ $.Values.global.probes.readiness.failureThreshold | default 3 }}
          livenessProbe:
            httpGet:
              path: /health
              port: 80
              scheme: HTTP
            initialDelaySeconds: {{ $.Values.global.probes.liveness.delay | default 90 }}
            periodSeconds: {{ $.Values.global.probes.liveness.period | default 10 }}
            timeoutSeconds: {{ $.Values.global.probes.liveness.timeout | default 3 }}
            failureThreshold: {{ $.Values.global.probes.liveness.failureThreshold | default 3 }}
{{- end }}
{{- if and (or (eq $name "znode10xwebstore") (eq $name "znode10xpagebuilder")) (hasKey $.Values.global "probes") }}
          readinessProbe:
            httpGet:
              path: /api/health-check
              port: 443
              scheme: HTTP
            initialDelaySeconds: {{ $.Values.global.probes.readiness.delay | default 60 }}
            periodSeconds: {{ $.Values.global.probes.readiness.period | default 5 }}
            timeoutSeconds: {{ $.Values.global.probes.readiness.timeout | default 3 }}
            failureThreshold: {{ $.Values.global.probes.readiness.failureThreshold | default 3 }}
          livenessProbe:
            httpGet:
              path: /api/health-check
              port: 443
              scheme: HTTP
            initialDelaySeconds: {{ $.Values.global.probes.liveness.delay | default 90 }}
            periodSeconds: {{ $.Values.global.probes.liveness.period | default 10 }}
            timeoutSeconds: {{ $.Values.global.probes.liveness.timeout | default 3 }}
            failureThreshold: {{ $.Values.global.probes.liveness.failureThreshold | default 3 }}
{{- end }}
      imagePullSecrets:
{{- if or (eq $name "znode10customapi") (eq $name "znode10xpagebuilder") (eq $name "znode10xwebstore") }}
        - name: tenantacrsecret
{{- else }}
        - name: {{ $.Values.global.imagePullSecrets }}
{{- end }}
{{- end }}
{{- end }}

{{- define "znode10.resources" -}}
{{- $enabled := or .enableResources $.Values.global.enableResources -}}
{{- if and $enabled .resources }}
resources:
{{ toYaml .resources | indent 12 }}
{{- end }}
{{- end }}

{{- define "znode.hpa" -}}
{{- if $.Values.global.enableHPA | default true }}
{{- range $name, $svc := .Values.resources }}
{{- if $svc.enableService | default true }}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ $name }}-hpa
  namespace: {{ $.Release.Namespace }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ $name }}
  minReplicas: {{ $svc.minReplicas | default $.Values.global.hpa.minReplicas | default 1 }}
  maxReplicas: {{ $svc.maxReplicas | default $.Values.global.hpa.maxReplicas | default 1 }}
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 75
---
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{- define "znode.pdb" -}}
{{- range $name, $svc := .Values.resources }}
{{- if $svc.enableService | default true }}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ $name }}-pdb
  namespace: {{ $.Release.Namespace }}
spec:
  minAvailable: 1
  selector:
    matchLabels:
      service: {{ $name }}
---
{{- end }}
{{- end }}
{{- end }}
