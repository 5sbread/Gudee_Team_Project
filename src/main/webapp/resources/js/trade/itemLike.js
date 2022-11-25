
const memberNum = $("#memberNum").val();

$("#likeBtn").click(function(){
	$.ajax({
		type : "POST",
		url : "itemlike/like",
		data : {
			itemNum : itemNum,
			memberNum : memberNum
		},
		success : function(){
            console.log("찜 성공")
			
		},
		error : function(){
            console.log("찜 x")
			
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
            console.log("찜 취소 성공")
			
		},
		error : function(){
            console.log("취소 x")
			
		}
	})
});
