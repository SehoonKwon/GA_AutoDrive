   
function figure1_CloseRequestFcn(hObject, eventdata, handles)
            
            disp('Bye');
        if    handles.moving ==1
            stop (handles.timer);
        end
        
        delete( handles.timer);
        
        delete(hObject);
end
        
% 타이머가 살아있기 때문에 타이머를 항상 죽여주고 끝내주어야하기때문에
% gui도 끝내줘야함