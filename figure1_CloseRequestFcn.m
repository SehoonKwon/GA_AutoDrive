   
function figure1_CloseRequestFcn(hObject, eventdata, handles)
            
            disp('Bye');
        if    handles.moving ==1
            stop (handles.timer);
        end
        
        delete( handles.timer);
        
        delete(hObject);
end
        
% Ÿ�̸Ӱ� ����ֱ� ������ Ÿ�̸Ӹ� �׻� �׿��ְ� �����־���ϱ⶧����
% gui�� ���������