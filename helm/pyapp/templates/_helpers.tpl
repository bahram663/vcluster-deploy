{{- define "pyapp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pyapp.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "pyapp.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pyapp.labels" -}}
app.kubernetes.io/name: {{ include "pyapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: Helm
{{- end -}}

{{- define "pyapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pyapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


