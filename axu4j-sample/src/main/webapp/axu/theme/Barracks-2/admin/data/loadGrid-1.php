<?php


$pageNo = $_POST["pageNo"];




?>

{
	result:"ok",
	list:[
		<?	
		for ($i = 1; $i< 20; $i++) {
			if($i > 1) echo ",";
			echo "{no:$pageNo$i, odate:'2014-12-12 19:19', ddate:'2014-12-12 19:19', channel:'액시스제이', orderno:'O99008182', productnm:'AXU 패키지', optionnm:'색상:파랑', modelnm:'ABC-0011', productno:'9980208', sellerproductno:'', brand:'', cost:54320, amount:5, ordercost:54320, receiver:'알수없음', r_phone1:'', r_phone2:'', ostat:'배송요청', delevery_type:'무료배송', delevery_cost:'0', delevery_msg:'빨리가져다주세요'},";
			echo "{no:$pageNo$i, odate:'2014-12-10 19:19', ddate:'2014-12-09 19:19', channel:'AXU', orderno:'O99008183', productnm:'액시콘 패키지', optionnm:'색상:노랑', modelnm:'ABC-0012', productno:'9980208', sellerproductno:'', brand:'', cost:54320, amount:5, ordercost:54320, receiver:'알수없음', r_phone1:'', r_phone2:'', ostat:'배송요청', delevery_type:'무료배송', delevery_cost:'0', delevery_msg:'빨리가져다주세요'}";
		}
		?>
	],
	page:{
		pageNo:<?=$pageNo?>,
		pageCount:100,	
		listCount:20
	},
	msg:""
}