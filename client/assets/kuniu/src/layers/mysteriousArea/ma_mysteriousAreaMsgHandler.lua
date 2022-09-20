G_MYSTERIOUS_MAP_MSG_CACHE = {}
G_MYSTERIOUS_QUESTION_STATE = {questionRewardGot = false, currentQuestionIndex = 1}
G_MYSTERIOUS_GOBLINGAME_STATE = {giftGot = false}  --�������������Ͳ����ٵ���С����Ϸ�Ի���,��Ϊ��tip
G_MYSTERIOUS_REVIVE_STETE = {alive = true}  --�����Ժ�ֻ��ѡ�񸴻���ܲ�����������˲������л���ɫaliveά��false�����
G_MYSTERIOUS_NOT_SHOW_AGAIN_STETE = {transfor = false, use_key = false, use_key_to_reset = false}

G_MYSTERIOUS_QUESTION_STATE.refreshRandomQuestions = function()
    G_MYSTERIOUS_QUESTION_STATE.questionPool = {}
    local questionsCfg = require("src/config/ma_questionsCfg")
    --������ظ�������г�ȡ5����Ŀ
    for i = 1, 5, 1 do
        local table_currentQuestion = questionsCfg[math.random(1, table.size(questionsCfg))]
        local table_answer = assert(loadstring("return " .. table_currentQuestion.q_answers))()
        local table_resultAnswers = {}
        local table_index_taken = {}
        local index_rightAnswer
        --����ÿ����Ŀ�Ĵ𰸵Ĵ���
        for index = 1, table.size(table_answer), 1 do
            while true do
                local index_random = math.random(1, table.size(table_answer))
                if not table_index_taken[index_random] then
                    table_index_taken[index_random] = true
                    table.insert(table_resultAnswers, table_answer[index_random])
                    if index_random == table_currentQuestion.q_rightAnswer then
                        --������ȷ�𰸵��±�index
                        index_rightAnswer = table.size(table_resultAnswers)
                    end
                    break
                end
            end
        end
        table_currentQuestion.index_rightAnswer = index_rightAnswer
        table_currentQuestion.answers = table_resultAnswers
        table.insert(G_MYSTERIOUS_QUESTION_STATE.questionPool, table_currentQuestion)
    end
end

G_MYSTERIOUS_QUESTION_STATE.refreshRandomQuestions()

g_msgHandlerInst:registerMsgHandler(MAZENODE_SC_NOTIFY, function(buff)
    if G_MAINSCENE and G_MAINSCENE.map_layer and G_MAINSCENE.map_layer.isMysteriousMap and G_MAINSCENE.map_layer.ready then
        G_MAINSCENE.map_layer:process_msg_maze_sc_notify(buff)
        return
    end
    table.insert(G_MYSTERIOUS_MAP_MSG_CACHE, buff)
end)