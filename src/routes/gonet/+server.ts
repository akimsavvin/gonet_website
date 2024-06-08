const html =
	'<!doctype html>\n' +
	'<html lang="en">\n' +
	'<head>\n' +
	'\t<meta charset="UTF-8">\n' +
	'\t<title>Go package</title>\n' +
	'\t<meta content="gonet.savvin.io/gonet git https://github.com/akimsavvin/gonet" name="go-import">\n' +
	'\t<meta content="gonet.savvin.io/gonet https://github.com/akimsavvin/gonet https://github.com/akimsavvin/gonet/tree/master{/dir} https://github.com/akimsavvin/gonet/blob/master{/dir}/{file}#L{line}" name="go-source">\n' +
	'</head>\n' +
	'<body>\n' +
	'\t<a href="https://gonet.savvin.io">gonet.savvin.io</a>\n' +
	'</body>\n' +
	'</html>';

export async function GET() {
	return new Response(html, {
		headers: {
			'Content-Type': 'text/html'
		}
	});
}
