.SILENT: check format render

default: check format

check:
	echo "checking..."
	.github/render_json.sh ./jsonnet /dev/null

format:
	echo "formatting..."
	.github/jsonnet_fmt.sh

render:
	echo "rendering..."
	.github/render_json.sh ./jsonnet ./json
