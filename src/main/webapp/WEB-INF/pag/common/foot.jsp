<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/js/jquery.js"></script>
<script src="/js/theme.js"></script>
<script src="/js/amazeui.min.js"></script>
<script src="/js/amazeui.datatables.min.js"></script>
<script src="/js/dataTables.responsive.min.js"></script>
<script src="/js/app.js"></script>
<script src="/js/vue.js"></script>
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
	<div class="am-modal-dialog">
		<div class="am-modal-hd"></div>
		<div class="am-modal-bd" id="successAlet"></div>
		<div class="am-modal-footer">
			<span class="am-modal-btn">确定</span>
		</div>
	</div>
</div>

<div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">
			<a href="javascript: void(0)" class="am-close am-close-spin"
				data-am-modal-close>&times;</a>
		</div>
		<div class="am-modal-bd" id="errorAlert"></div>
	</div>
</div>

<script>

var host=window.location.host;
	var url="ws://"+host+"/Information";
	var ws = new WebSocket(url);/* 这里注意url地址127和localhost是完全不同的   */
	
	ws.onopen = function(){
		console.log("websocket已连接");
		loadMessage();
	};
	
	ws.onmessage = function(evt)  {  console.log('服务器端发送的消息：'+ evt.data); };
	ws.onclose   = function(evt)  {  console.log("close"); };
	ws.onerror   = function(evt)  {  console.log("error"); };
	
	var app =new Vue({
		el : '#appFlow',
		data : {
			flowList : []/*vue的使用数据以数组的形式保存  ,注意这里的appFlow 对应 head中的 id  flowList 同样对应 head中的 ，所以这里不是 随意定义 ,同时这里还需要注意的是 include的jsp 是分开编译 然后 拼接在一起的 ,所以要注意不同jsp的方法最好不同  */
		}
	})
	
	function loadMessage() {
		$.post("/message//Information.do",{},callback);
	}
	
	function callback(messageDTO,status){/* 这里可以知道ajax的形式可以不一样  */
		var unReadNumber=messageDTO.unReadNumber;
		var results=messageDTO.obj;
		var startTime = new Date().getTime();
		for (var i=0;i<results.length; i++) {
			var result = results[i];
			result.time = parseInt((startTime-result.createTime)/1000/60);
			result.filed = '分钟之前';
			if (result.time >= 60) {
				result.time = parseInt(result.time/60);
				result.filed = '小时之前';
			}
		}
		
		app.flowList=results;
		$("#unReadNumber").html(unReadNumber);	
	}
	
</script>