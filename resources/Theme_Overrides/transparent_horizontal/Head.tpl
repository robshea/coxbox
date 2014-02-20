<$if (PageModel.IE7Compatibility)$><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /><$endif$>
<$PageModel.Styles:Links(stylesheet = "true")$>
<$PageModel.InlineScripts:Links(inlineScript = "true")$>
<$PageModel.Scripts:Links(script = "true")$>
<$PageModel.Rss:Links(rss = "true")$>

<title><$PageModel.Title$></title>
<$if (PageModel.Keywords)$><meta name="Keywords" content="<$PageModel.Keywords$>"/><$endif$>
<$if (PageModel.Description)$><meta name="Description" content="<$PageModel.Description$>" /><$endif$>
<$PageModel.RawHeaders$>