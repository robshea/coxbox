<$if (PageModel.IE7Compatibility)$><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /><$endif$>
<$PageModel.Styles:Links(stylesheet = "true")$>
<$PageModel.InlineScripts:Links(inlineScript = "true")$>
<$PageModel.Scripts:Links(script = "true")$>
<$PageModel.Rss:Links(rss = "true")$>

<title><$PageModel.Title$></title>
<$if (PageModel.Keywords)$><meta name="Keywords" content="<$PageModel.Keywords$>"/><$endif$>
<$if (PageModel.Description)$><meta name="Description" content="<$PageModel.Description$>" /><$endif$>
<$PageModel.RawHeaders$>

<link href='http://fonts.googleapis.com/css?family=News+Cycle:400,700' rel='stylesheet' type='text/css'>
<link href="/resources/css/jcarousel.css" media="all" rel="stylesheet" type="text/css">
<link href="/resources/css/coxbox.css" media="all" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/js/modernizr.custom.04823.js"></script>
<script src="/resources/js/jquery.jcarousel.min.js"></script>
<script src="/resources/js/jcarousel.js"></script>
<script src="/resources/js/coxbox.js"></script>