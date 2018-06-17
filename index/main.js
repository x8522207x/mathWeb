function escapeHTML(a){return a.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;")}function initBxSlider(f,a,c,e){var b={slideWidth:5000,minSlides:e,maxSlides:e,slideMargin:5,pager:false,controls:false,infiniteLoop:false};for(var d in c){b[d]=c[d]}window[f]=$(a).bxSlider(b)}function initRWDHeaderSlider(){$.slidebars()}function switchPageLang(a){$("#input-page-lang").val(a);$("#form-page-lang")[0].submit()}function errorAjax(a){console.log(a)}function toggleDownloadEntrySet(){var a=$(".download-entry-set").css("display");if(a=="none"){a=""}else{a="none"}$(".download-entry-set").css("display",a)}function scrollToTop(){document.body.scrollTop=document.documentElement.scrollTop=0}function downloadResource(c,a){var b=window.location.href;var d="CONSTRUCT { <"+b+"> ?p ?o. } WHERE { <"+b+"> ?p ?o. }";$("#download_form input[name=query]").val(encodeURIComponent(d));$("#download_form input[name=type]").val(c);$("#download_form input[name=filename]").val(a);$("#download_form")[0].submit()}function cancelHideDownloadSet(){clearTimeout(hideTimeoutID);hideTimeoutID=null}function triggerHideDownloadSet(){if(hideTimeoutID!=null){clearTimeout(hideTimeoutID)}hideTimeoutID=setTimeout(function(){$(".download-entry-set").css("display","none")},4000)}function gotoSparqlExample(a){var b=$("#cache_example-"+a).val();$("#goto-form input").val(b);$("#goto-form")[0].submit()}function showExample(a){var b=$("#cache_example-"+a).val();codeMirror.setValue(b.replace(/\\n/g,"\n"))}function togglePrefix(b){var d=codeMirror.getValue();var c=$(b).text();var e=$(b).attr("data-prefix");var f=new RegExp("PREFIX\\s+"+c+":\\s+<"+e+">[\\s\\n]+","igm");if(d.search(f)<0){var a="PREFIX "+c+": <"+e+">\n";codeMirror.setValue(a+d)}codeMirror.focus()}function toggleAllPrefixes(){elements=$(".prefix-slider button.slide");for(var a=0;a<elements.length;a++){togglePrefix(elements[a])}}function replacePredicateRow(c,e){var d=$("#cache_predicate-"+c).val().split(",");d.sort();var b="";b+='<i class="fa fa-caret-left arrow-icon" aria-hidden="true" onclick="predicateSlider.goToPrevSlide();"></i>';b+='<div class="slide-container"><div>';for(var a=0;a<d.length;a++){b+='<button class="slide slide-inactive" onclick="insertPredicate(\''+c+"', '"+d[a]+"');\">"+d[a]+"</button>"}b+="</div></div>";b+='<i class="fa fa-caret-right arrow-icon" aria-hidden="true" onclick="predicateSlider.goToNextSlide();"></i>';$(".predicate-slider").html(b);initBxSlider("predicateSlider",".predicate-slider .slide-container > div",{},6)}function insertPredicate(d,b){var a=codeMirror.getCursor("from");var c=d+":"+b;codeMirror.replaceRange(c,a);codeMirror.focus()}function errorSPARQL(b){var a='<div class="row 0%"><pre>';a+=escapeHTML(b.responseText);a+="</pre></div>";$("#result_block").html(a)}function submitSPARQL(){var f=codeMirror.getValue();var d=new RegExp("(?:OFFSET|LIMIT)\\s+[\\d\\s]+","igm");var c=f.replace(d,"");$("#cache_SPARQL").val(encodeURIComponent(c));var h=new RegExp("PREFIX\\s+.*?<.*?>[\\s\\n]*","igm");var e=c.match(h);var g="";if(e!=null){for(var b=0;b<e.length;b++){g+=e[b]}}g+="SELECT (COUNT(*) AS ?total) WHERE { {";g+=c.replace(h,"");g+="} }";var a='<div class="row 0%"><pre>Loading</pre></div>';$("#result_block").html(a);$.ajax({url:se,method:"GET",type:"GET",data:{"default-graph-uri":dg,query:g,format:"json",timeout:st,debug:"on"},dataType:"json",success:function(k){var l=parseInt(k.results["bindings"][0]["total"]["value"]);var j=Math.ceil(l/parseInt($("#cache_page-items").val()));if(j>0){$("#cache_total-page").val(j);changePage(1)}else{var i='<div class="row 0%">Results not found.</div>';$("#result_block").html(i)}},error:errorSPARQL})}function changePage(d){var c=decodeURIComponent($("#cache_SPARQL").val());var b=parseInt($("#cache_total-page").val());if(d<1){d=1}else{if(d>b){d=b}}$("#cache_page").val(d);var e=parseInt($("#cache_page-items").val());c+=" OFFSET "+((d-1)*e)+" LIMIT "+e;var a='<div class="row 0%"><pre>Loading</pre></div>';$("#result_block").html(a);$.ajax({url:se,method:"GET",type:"GET",data:{"default-graph-uri":dg,query:c,format:"json",timeout:st,debug:"on"},dataType:"json",success:replaceSPARQLResult,error:errorSPARQL})}function replaceSPARQLResult(a){$.ajax({url:"api/create_result_block.php",method:"POST",type:"POST",data:{raw:JSON.stringify(a),page:parseInt($("#cache_page").val()),total_page:parseInt($("#cache_total-page").val())},dataType:"html",success:function(b){$("#result_block").html(b);initBxSlider("downloadSlider",".download-slider > div",{},4);$("#page-jumper").bind("keyup",function(c){if(c.keyCode==13){var d=$("#page-jumper").val();if(isNaN(d)){alert("欲切換的頁數，必須是一個數字")}else{changePage(parseInt(d))}}})},error:errorAjax})}function downloadSPARQLResult(b,a){$("#download_form input[name=query]").val($("#cache_SPARQL").val());$("#download_form input[name=type]").val(b);$("#download_form input[name=filename]").val(a);$("#download_form")[0].submit()}var se="http://data.ascdc.tw/sparql";var dg="";var st=60000;
