
let memberNum = $("#memberNum").val();

$("#likeBtn").click(function(){
	$.ajax({
		type : "POST",
		url : "itemlike/like",
		data : {
			itemNum : itemNum,
			memberNum : memberNum
		},
		success : function(){
			location.reload()
		},
		error : function(){
			location.reload()
		}
	})
});
	
	
$("#unlikeBtn").click(function(){
	$.ajax({
		type : "POST",
		url : "itemlike/unlike",
		data : {
			itemNum : itemNum,
			memberNum : memberNum
		},
		success : function(){
            location.reload()
		},
		error : function(){
            location.reload()
		}
	})
});

$(".delme_Btn").click(function(){
	$.ajax({
		type : "POST",
		url : "itemlike/unlike",
		data : {
			itemNum : itemNum,
			memberNum : memberNum
		},
		success : function(){
            location.reload()
		},
		error : function(){
            location.reload()
		}
	})
});
