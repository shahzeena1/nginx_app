{{- define "oauth2-proxy.cookieSecret" -}}
{{ randAlphaNum 32 | b64enc }}
{{- end }}
