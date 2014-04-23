


function test_alert(msg)
{
//    弹框提醒的
    alert(msg);

}

function obj_alert()
{
    location = "BiEvent://onBICustomEvent";
}

function onClick()
{
	var arr = [];
	for ( var i = 0; i < 8; i++) {
		if(i==0){
			arr[i] = 'test';//再通过节点对象获取里面的数据
		}else if(i==1){
			arr[i] = 'test11111';//再通过节点对象获取里面的数据
		}else{
			arr[i] = 'test22222';//再通过节点对象获取里面的数据
		}
	}
	BiEvent.onBIClickEvent('test2','test2',arr);
}