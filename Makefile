.SILENT: check format render

all: check format

check:
	echo "checking..."
	.github/render_json.sh ./jsonnet /dev/null

format:
	echo "formatting..."
	.github/jsonnet_format_check.sh

render:
	echo "rendering..."
	.github/render_json.sh ./jsonnet ./json
