{{/* vim: set filetype=mustache: */}}
{{/*
Name of the chart.
*/}}
{{- define "kubeclarity.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kubeclarity.fullname" -}}
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

{{- define "kubeclarity.sbom-db.fullname" -}}
{{ include "kubeclarity.fullname" . }}-sbom-db
{{- end -}}

{{- define "kubeclarity.grype-server.fullname" -}}
{{ include "kubeclarity.fullname" . }}-grype-server
{{- end -}}

{{/*
Helm labels.
*/}}
{{- define "kubeclarity.labels" -}}
    app.kubernetes.io/name: {{ include "kubeclarity.fullname" . }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "kubeclarity.sbom-db.labels" -}}
    app.kubernetes.io/name: {{ include "kubeclarity.sbom-db.fullname" . }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "kubeclarity.grype-server.labels" -}}
    app.kubernetes.io/name: {{ include "kubeclarity.grype-server.fullname" . }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
