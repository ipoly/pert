
class PERT
    constructor:(o)->
        $.extend(@,o)
        @O = Number(@O)
        @N = Number(@N)
        @P = Number(@P)
        return $.error("缺少'任务名称'") unless @name
        return $.error("缺少'乐观估计':这是非常乐观的数字，如果一切都异常顺利，你可以在这个时间内完成。") unless @O
        return $.error("缺少'标称估计':这是概率最大的数字。") unless @N
        return $.error("缺少'悲观估计':这是最糟糕的数字，它应当考虑到各种以外。") unless @P

        # 任务的期望完成时间
        @u = ((@O + @N*4 + @P)/6).toFixed(2)
        # 任务的概率分布标准差
        @o = ((@P - @O)/6).toFixed(2)
        @id = parseInt(Math.random(new Date())*Math.pow(10,8))

        PERT.items.push(@)
        PERT.sta()

    # 检验输入有效性
    checkValid:(dataStr)->
        data = parseInt(dataStr)

    # 存储添加的pert项目
    @items: []
    @u: 0
    @o: 0

    # 统计所有任务的统计分布
    @sta: ->
        if @items.length
            uSta = (eval((item.u for item in @items).join("+")))
            @u = (uSta).toFixed(2)

            oSta = (eval((Math.pow(item.o,2) for item in @items).join("+")))
            @o = Math.sqrt(oSta).toFixed(2)

    # 根据id或name查找pert项目
    @find: (nameOrId)->
        result = (item for item in @items when item.name is nameOrId or item.id is nameOrId)
        return false if result.length is 0
        return result[0] if result.length is 1
        result

    # 根据id或name删除pert项目
    @del: (nameOrId)->
        @items = (item for item in @items when (item.name != nameOrId and item.id != nameOrId))

window.PERT = PERT





