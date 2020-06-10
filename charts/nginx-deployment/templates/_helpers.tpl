
{{- define "nginx-deployment-v1.labels" -}}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
app: nginx-deployment
keel.sh/policy: force
version: v1
{{- end -}}

{{- define "nginx-deployment-v1.matchLabels" -}}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
app: nginx-deployment
version: v1
{{- end -}}

{{- define "nginx-deployment-v1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "nginx-deployment-v1.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
