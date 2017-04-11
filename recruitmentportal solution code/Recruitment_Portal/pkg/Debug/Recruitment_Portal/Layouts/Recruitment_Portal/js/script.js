var x,y,n=0,ny=0,rotINT,rotYINT
function startYRotate()
{
ny=ny+1
y.style.transform="rotateY(" + ny + "deg)"
y.style.webkitTransform="rotateY(" + ny + "deg)"
y.style.OTransform="rotateY(" + ny + "deg)"
y.style.MozTransform="rotateY(" + ny + "deg)"
if (ny==180 || ny>=360)
	{
	clearInterval(rotYINT)
	if (ny>=360){ny=0}
	}
}

function rotateYDIV()
{
y=document.getElementById("fliplogo")
clearInterval(rotYINT)
rotYINT=setInterval("startYRotate()",0.75)
}
function rotateZDIV()
{
y=document.getElementById("flipicon")
clearInterval(rotYINT)
rotYINT=setInterval("startYRotate()",0.75)
}

$(document).ready(function(){
    $(".cmt-actvts span").click(function(){
        $(".like").toggleClass("liked");
    });
	
	$('.main_feed_cntr').slimScroll({
		width: '100%',
		height: '436px',
		size: '7px',
		color: '#777',
		alwaysVisible: false,
		distance: '5px',
		allowPageScroll: true,
	});
	
});