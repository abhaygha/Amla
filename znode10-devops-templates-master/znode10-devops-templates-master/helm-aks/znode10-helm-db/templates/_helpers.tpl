{{- define "znode10-helm-db.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "znode10-helm-db.fullname" -}}
{{- printf "%s" (include "znode10-helm-db.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}
