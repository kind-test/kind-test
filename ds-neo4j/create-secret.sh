#! /usr/bin/env bash
# Create the secret.yaml file from secret.env
#
# Since the generated secret uses base64 encoding,
# you may wish to add the following to your .bash_aliases:
#
# b64decode() {
#	echo $@ | base64 -d; echo
#}


# Enter the directory where this script is located
# So we can grab secret.env and dump secret.yaml to the correct place
script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
pushd "$script_dir"

mkdir -p pre/templates

kubectl create secret generic "{{ .Values.mainReleaseName }}-secret" \
  --dry-run=client \
  -n "{{ .Release.Namespace }}" \
  --from-env-file secret.env \
  -o yaml | tee pre/templates/secret.yaml | yq

popd