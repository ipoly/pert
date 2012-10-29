# 导入coffee文档
# @codekit-prepend pert
data = [{name:"切片",O:1,N:4,P:12},{name:"jira任务管理",O:3,N:8,P:24},{name:"表单验证插件",O:3,N:5,P:8}]

$(document).on("pagebeforeshow","#home",->
	tmp_list = juicer("""
		{@each items as item}
			<li>
				<a>
					<h1>${item.name}</h1>
					<p><strong>期望完成时间:</strong>${item.u} <strong>标准差:</strong>${item.o}</p>
				</a>
			</li>
		{@/each}
		<li>
			<h1>总计</h1>
			<p>期望完成时间:${_.u} 标准差:${_.o}</p>
		</li>
	""")


	for i in data
		new PERT(i)

	$("#projects").html(tmp_list.render(PERT)).listview("refresh")

)