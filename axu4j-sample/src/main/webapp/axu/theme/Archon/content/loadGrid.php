<?php
$pageNo = $_POST["pageNo"];
?>
{
	result:"ok",
	list:[
<? for ($i = 1;$i<21; $i++){ ?>
        {idx:<?=$pageNo.$i?>, donateType:"eul", donatePrice:200000, hpp:"010-xxxx-1234", email:"xxx%40setuh.com", address:"주소불명", regiDate:"2013-09-17 15:22:00", IP:"61.72.190.23", accountCheck:"Y", accountCheckDate:"2013-09-17 15:22:00", donateFeedback:"N", donateFeedbackDate:"", rowseq:<?=$pageNo.$i?>},
<? } ?>
	],
	page:{
		pageNo:<?=$pageNo?>,
		pageCount:200,
		listCount:20
	},
	msg:""
}