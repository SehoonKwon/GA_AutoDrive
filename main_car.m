function varargout = main_car(varargin)

% BOUNCE_car MATLAB code for bounce_car.fig
%      BOUNCE_car, by itself, creates a new BOUNCE_car or raises the existing
%      singleton*.
%
%      H = BOUNCE_car returns the handle to a new BOUNCE_car or the handle to
%      the existing singleton*.
%
%      BOUNCE_car('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BOUNCE_car.M with the given input arguments.
%
%      BOUNCE_car('Property','Value',...) creates a new BOUNCE_car or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bounce_car_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bounce_car_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bounce_car

% Last Modified by GUIDE v2.5 05-Dec-2018 17:42:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @main_car_OpeningFcn, ...
    'gui_OutputFcn',  @main_car_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before bounce_car is made visible.
function main_car_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bounce_car (see VARARGIN)


box_x = [10 28.7 28.7 10];
box_y = [16 16 29 29];


ball.p= patch(box_x,box_y,'k');

t= linspace(0,2*pi,50); R=1;
x= R*cos(t); y=R*sin(t);
p1=patch(x+12,y+20,'c'); hold on; grid on;
p1=patch(x+12,y+25,'c');

% hidden layer
p2=patch(x+17,y+18,'c');
p2=patch(x+17,y+23,'c');
p2=patch(x+17,y+28,'c');

p3=patch(x+22,y+20,'c'); 
p3=patch(x+22,y+25,'c');

% output
p4=patch(x+27,y+20,'c'); 
p4=patch(x+27,y+25,'c');

lineline.width=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
lineline.color=['c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c'];


Ax=[13,16];
Ay1=[25 28]; 
Ay2=[25 23];
Ay3=[25 18];
Ay4=[20 28];
Ay5=[20 23];
Ay6=[20 18];

Bx=[18 21];
By1= [28 25];
By2= [28 20];
By3= [23 25];
By4= [23 20];
By5= [18 25];
By6= [18 20];

Cx=[23 26];
Cy1= [25 25];
Cy2= [25 20];
Cy3= [20 25];
Cy4= [20 20];



line1=line(Ax,Ay1,'LineWidth',lineline.width(1),'color',lineline.color(1)); line2=line(Ax,Ay2,'LineWidth',lineline.width(2),'color',lineline.color(2)); 
line3=line(Ax,Ay3,'LineWidth',lineline.width(3),'color',lineline.color(3)); line4=line(Ax,Ay4,'LineWidth',lineline.width(4),'color',lineline.color(4)); 
line5=line(Ax,Ay5,'LineWidth',lineline.width(5),'color',lineline.color(5)); line6=line(Ax,Ay6,'LineWidth',lineline.width(6),'color',lineline.color(6)); 
line7=line(Bx,By1,'LineWidth',lineline.width(7),'color',lineline.color(7)); line8=line(Bx,By2,'LineWidth',lineline.width(8),'color',lineline.color(8)); 
line9=line(Bx,By3,'LineWidth',lineline.width(9),'color',lineline.color(9)); line10=line(Bx,By4,'LineWidth',lineline.width(10),'color',lineline.color(10)); 
line11=line(Bx,By5,'LineWidth',lineline.width(11),'color',lineline.color(11));line12=line(Bx,By6,'LineWidth',lineline.width(12),'color',lineline.color(12)); 
line13=line(Cx,Cy1,'LineWidth',lineline.width(13),'color',lineline.color(13));line14=line(Cx,Cy2,'LineWidth',lineline.width(14),'color',lineline.color(14)); 
line15=line(Cx,Cy3,'LineWidth',lineline.width(15),'color',lineline.color(15));line16=line(Cx,Cy4,'LineWidth',lineline.width(16),'color',lineline.color(16));


theta_1 = linspace(0,pi/2);
theta_2 = linspace(pi/2,pi);
theta_3 = linspace(pi,3*(pi/2));
theta_4 = linspace(-3*(pi/2),-pi);


R_1=5;
R_2=3;

x= 0:0.03:2;
y1=zeros(size(x));

r_x= 2:-0.03:0;
r_y1=zeros(size(r_x));

y=0:0.03:6;
y_1=0:0.03:2;

r_y= 6:-0.03:0;
r_y_11=2:-0.03:0;

x1=zeros(size(y));
x2=zeros(size(y_1));

r_x1=zeros(size(r_y));
r_x2=zeros(size(r_y_11));

for t_i= 1:100
    
    P_1_B(t_i,:) = R_1*[sin(theta_1(t_i)) cos(theta_1(t_i))];
    P_1_S(t_i,:) = R_2*[sin(theta_1(t_i)) cos(theta_1(t_i))];
    
    P_2_B(t_i,:) = R_1*[cos(theta_2(t_i)) sin(theta_2(t_i))];
    P_2_S(t_i,:) = R_2*[cos(theta_2(t_i)) sin(theta_2(t_i))];
    
    P_3_B(t_i,:) = R_1*[cos(theta_3(t_i)) sin(theta_3(t_i))];
    P_3_S(t_i,:) = R_2*[cos(theta_3(t_i)) sin(theta_3(t_i))];
    
    P_4_B(t_i,:) = R_1*[sin(theta_4(t_i)) cos(theta_4(t_i))];
    P_4_S(t_i,:) = R_2*[sin(theta_4(t_i)) cos(theta_4(t_i))];
end



%% track 1
plot(x,y1-1,'r');     %16
hold on;
plot(x,y1+1,'r');    %15


plot(P_1_B(:,1)+2,P_1_B(:,2)-4,'r');   % 14
plot(P_1_S(:,1)+2,P_1_S(:,2)-4,'r');   % 13

plot(P_3_B(:,1)+10,P_3_B(:,2)-4,'r');   % 12
plot(P_3_S(:,1)+10,P_3_S(:,2)-4,'r');   % 11
%
plot(x+10,y1-7,'r');      % 10
plot(x1+12,y-13,'r');    %  9
plot(x2+10,y_1-11,'r');  % 8

plot(r_x+10,y1-13,'r');    % 7
plot(r_x+8,y1-13,'r');     %6
plot(r_x+6,y1-13,'r');    % 5
plot(r_x+4,y1-13,'r');    %4

plot(r_x+8,y1-11,'r');   % 3
plot(r_x+6,y1-11,'r');   % 2
plot(r_x+4,y1-11,'r');   % 1

plot(P_2_B(:,1)+4,P_2_B(:,2)-16,'r');   %17
plot(P_2_S(:,1)+4,P_2_S(:,2)-16,'r');    %18

plot(x2+1,y_1-18,'r');    %19

plot(r_x-1,y1-18,'r');     %20
plot(r_x-3,y1-18,'r');    %21
plot(r_x-5,y1-18,'r');   %22

plot(r_x-3,y1-16,'r');    %23
plot(r_x-5,y1-16,'r'); %24

plot(P_3_B(:,1)-5,P_3_B(:,2)-13,'r');  %25
plot(P_3_S(:,1)-5,P_3_S(:,2)-13,'r');   %26

plot(r_x-12,y1-13,'r');     %27
plot(r_x-14,y1-13,'r');     %28

plot(x2-8,y_1-13,'r');    %29


plot(r_x-12,y1-11,'r');      %30
plot(r_x-10,y1-11,'r');      %31

plot(x1-14,y-13,'r');       %32

plot(x2-12,y_1-11,'r');     %33
plot(x2-12,y_1-9,'r');    %34


plot(x1-14,y-7,'r');       %35

plot(x1-12,y-7,'r');     %36

plot(P_2_B(:,1)-9,P_2_B(:,2)-1,'r');   %37
plot(P_2_S(:,1)-9,P_2_S(:,2)-1,'r');    %38

plot(P_4_B(:,1)-9,P_4_B(:,2)+7,'r');   % 39
plot(P_4_S(:,1)-9,P_4_S(:,2)+7,'r');   % 40

plot(P_1_B(:,1)-9,P_1_B(:,2)+7,'r');   % 41
plot(P_1_S(:,1)-9,P_1_S(:,2)+7,'r');   % 42

plot(r_x-11,y1+10,'r');      %43
plot(r_x-13,y1+10,'r');      %44
plot(r_x-15,y1+10,'r');      %45

plot(r_x-11,y1+12,'r');      %46
plot(r_x-13,y1+12,'r');      %47

plot(x1-15,y+10,'r');       %48

plot(x2-13,y_1+12,'r');     %49
plot(x2-13,y_1+14,'r');      %50

plot(P_2_B(:,1)-10,P_2_B(:,2)+16,'r');   %51
plot(P_2_S(:,1)-10,P_2_S(:,2)+16,'r');   %52

plot(r_x-10,y1+19,'r');     %53
plot(r_x-8,y1+19,'r');     %54
plot(r_x-6,y1+19,'r');     %55
plot(r_x-4,y1+19,'r');     %56

plot(r_x-10,y1+21,'r');     %57
plot(r_x-8,y1+21,'r');     %58
plot(r_x-6,y1+21,'r');     %59
plot(r_x-4,y1+21,'r');     %60
plot(r_x-2,y1+21,'r');     %61

plot(x1,y+15,'r');       %62

plot(x2-2,y_1+17,'r');     %63
plot(x2-2,y_1+15,'r');      %64

plot(P_3_B(:,1)+3,P_3_B(:,2)+15,'r');  %65
plot(P_3_S(:,1)+3,P_3_S(:,2)+15,'r');   %66

plot(r_x+3,y1+12,'r');     %67
plot(r_x+3,y1+10,'r');     %68
plot(r_x+5,y1+12,'r');     %69
plot(r_x+5,y1+10,'r');     %70
plot(r_x+7,y1+12,'r');     %71
plot(r_x+7,y1+10,'r');     %72
plot(r_x+9,y1+12,'r');     %73
plot(r_x+9,y1+10,'r');     %74

plot(P_1_B(:,1)+11,P_1_B(:,2)+7,'r');   % 75
plot(P_1_S(:,1)+11,P_1_S(:,2)+7,'r');   % 76



plot([ -30 30 30 -30 -30], [-30 -30 30 30 -30], 'o-', 'LineWidth',5);
%%추가

global flag;
flag = 1;

global count;
count = 0;

global Gen;
Gen = 1;

global CN;
CN=10;

global W;
for i= 1:CN
    W(i,:) = -7 +(14)*rand(1,16);
    %W(i,:) = [2.522847994	-3.044795484	4.499720851	-2.88246796	-1.538595936	6.315131336	4.693564543	5.463033398	6.056245963	-5.188951361	-2.123992826	2.990545037	1.752088786	4.670662371	-3.912945556	-2.529512594
% ];
end


global color;
color = 'w';
for i = 1 : CN
    color(i,:) = 'w';
end

speed1= 0.12;
my_angle1= pi/50;

speed2 = 0.12;
my_angle2 = pi/20;

speed3 = 0.12;
my_angle3 = pi/60;

speed4= 0.12;
my_angle4= pi/60;

speed5= 0.12;
my_angle5= pi/60;

speed6= 0.12;
my_angle6= pi/60;

speed7= 0.12;
my_angle7= pi/60;

speed8= 0.12;
my_angle8= pi/60;

speed9= 0.12;
my_angle9= pi/60;

speed10= 0.12;
my_angle10= pi/60;

car10= Make_car( color(1,1), speed1, my_angle1);
car9 = Make_car( color(2,1), speed2, my_angle2);
car8 = Make_car(color(3,1), speed3, my_angle3);
car7 = Make_car( color(4,1), speed4, my_angle4);
car6 = Make_car(color(5,1), speed5, my_angle5);
car5 = Make_car( color(6,1), speed6, my_angle6);
car4 = Make_car( color(7,1), speed7, my_angle7);
car3 = Make_car(color(8,1), speed8, my_angle8);
car2 = Make_car(color(9,1), speed9, my_angle9);
car = Make_car( color(10,1), speed10, my_angle10);

%%

axis off;

h = findobj(gca,'Color','r');
x_11 = get(h, 'xdata');
y_11 = get(h, 'ydata');

%%% track 1
track.xdata1= [x_11{76,1} x_11{75,1} x_11{74,1} x_11{73,1} x_11{72,1} x_11{71,1} x_11{70,1} x_11{69,1} x_11{68,1}...
    x_11{67,1} x_11{66,1} x_11{65,1} x_11{64,1} x_11{63,1} x_11{62,1} x_11{61,1} x_11{60,1} x_11{59,1} x_11{58,1}...
    x_11{57,1} x_11{56,1} x_11{55,1} x_11{54,1} x_11{53,1} x_11{52,1} x_11{51,1}...
    x_11{50,1} x_11{49,1} x_11{48,1} x_11{47,1} x_11{46,1} x_11{45,1} x_11{44,1} x_11{43,1} x_11{42,1} x_11{41,1}...
    x_11{40,1} x_11{39,1} x_11{38,1} x_11{37,1} ...
    x_11{36,1} x_11{35,1} x_11{34,1} x_11{33,1} x_11{32,1} x_11{31,1} x_11{30,1} x_11{29,1} x_11{28,1} x_11{27,1} x_11{26,1} ...
    x_11{25,1} x_11{24,1} x_11{23,1} x_11{22,1} x_11{21,1} ...
    x_11{20,1} x_11{19,1} x_11{18,1} x_11{17,1} x_11{16,1} x_11{15,1}  x_11{14,1} ...
    x_11{13,1}  x_11{12,1} x_11{11,1} x_11{10,1} x_11{9,1}  x_11{8,1} x_11{7,1} x_11{6,1} x_11{5,1} x_11{4,1} x_11{3,1} ...
    x_11{2,1} x_11{1,1} ];


track.ydata1= [y_11{76,1} y_11{75,1} y_11{74,1} y_11{73,1} y_11{72,1} y_11{71,1} y_11{70,1} y_11{69,1} y_11{68,1}...
    y_11{67,1} y_11{66,1} y_11{65,1} y_11{64,1} y_11{63,1} y_11{62,1} y_11{61,1} y_11{60,1} y_11{59,1} y_11{58,1}...
    y_11{57,1} y_11{56,1} y_11{55,1} y_11{54,1} y_11{53,1} y_11{52,1} y_11{51,1}...
    y_11{50,1} y_11{49,1} y_11{48,1} y_11{47,1} y_11{46,1} y_11{45,1} y_11{44,1} y_11{43,1} y_11{42,1} y_11{41,1}...
    y_11{40,1} y_11{39,1} y_11{38,1} y_11{37,1} ...
    y_11{36,1} y_11{35,1} y_11{34,1} y_11{33,1} y_11{32,1} y_11{31,1} y_11{30,1} y_11{29,1} y_11{28,1} y_11{27,1} y_11{26,1} ...
    y_11{25,1} y_11{24,1} y_11{23,1} y_11{22,1} y_11{21,1} ...
    y_11{20,1} y_11{19,1} y_11{18,1} y_11{17,1} y_11{16,1} y_11{15,1}  y_11{14,1} ...
    y_11{13,1} y_11{12,1} y_11{11,1} y_11{10,1} y_11{9,1}  y_11{8,1} y_11{7,1} y_11{6,1} y_11{5,1} y_11{4,1} y_11{3,1} ...
    y_11{2,1} y_11{1,1} ];
%%%


track.xtrans=0;
track.ytrans=0;

handles.car = car; % 방금만든 구조체를 그냥 집어넣음
handles.car2 = car2; %%%%%%%%%%%%% 추가
handles.car3 = car3;
handles.car4 = car4;
handles.car5 = car5;
handles.car6 = car6;
handles.car7 = car7;
handles.car8 = car8;
handles.car9 = car9;
handles.car10 = car10;
handles.track = track;
handles.lineline= lineline;
handles.line1= line1;  handles.line2= line2;
handles.line3= line3;  handles.line4= line4;
handles.line5= line5;  handles.line6= line6;
handles.line7= line7;  handles.line8= line8;
handles.line9= line9;  handles.line10= line10;
handles.line11= line11;  handles.line12= line12;
handles.line13= line13;  handles.line14= line14;
handles.line15= line15;  handles.line16= line16;


handles.timer = timer('ExecutionMode' , 'FixedRate', 'Period', 0.1,'TimerFcn', {@move_car3,hObject});

% excutionmode -> fixedrate 일정주기마다 부름
% period 어떤 주기별로 부를것인가
% TimerFcn 원하는 함수를 불러오는것 / hObject를 하는것은 우리가 만든
% figure 전체에 것들을 불러올수 있기 때문임
handles.moving = 0;
% 현재의 상태를 나타냄
% Choose default command line output for bounce_car
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% 길만들어주는 부분

% UIWAIT makes bounce_car wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = main_car_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.moving ==0
    start (handles.timer);
    set(hObject, 'String', 'Stop');
    handles.moving =1;
    
else
    stop(handles.timer);
    set(hObject, 'String', 'Play');
    handles.moving =0;
end

guidata(hObject, handles);



function editAnswer_Callback(hObject, eventdata, handles)
% hObject    handle to editAnswer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAnswer as text
%        str2double(get(hObject,'String')) returns contents of editAnswer as a double


% --- Executes during object creation, after setting all properties.
function editAnswer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAnswer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAnswer2_Callback(hObject, eventdata, handles)
% hObject    handle to editAnswer2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAnswer2 as text
%        str2double(get(hObject,'String')) returns contents of editAnswer2 as a double


% --- Executes during object creation, after setting all properties.
function editAnswer2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAnswer2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAnswer3_Callback(hObject, eventdata, handles)
% hObject    handle to editAnswer3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAnswer3 as text
%        str2double(get(hObject,'String')) returns contents of editAnswer3 as a double


% --- Executes during object creation, after setting all properties.
function editAnswer3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAnswer3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAnswer4_Callback(hObject, eventdata, handles)
% hObject    handle to editAnswer4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAnswer4 as text
%        str2double(get(hObject,'String')) returns contents of editAnswer4 as a double


% --- Executes during object creation, after setting all properties.
function editAnswer4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAnswer4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla(handles.axes1,'reset');
box_x = [10 28.7 28.7 10];
box_y = [16 16 29 29];

ball.p= patch(box_x,box_y,'k');

t= linspace(0,2*pi,50); R=1;
x= R*cos(t); y=R*sin(t);
p1=patch(x+12,y+20,'c'); hold on; grid on;
p1=patch(x+12,y+25,'c');

% hidden layer
p2=patch(x+17,y+18,'c');
p2=patch(x+17,y+23,'c');
p2=patch(x+17,y+28,'c');

p3=patch(x+22,y+20,'c'); 
p3=patch(x+22,y+25,'c');

% output
p4=patch(x+27,y+20,'c'); 
p4=patch(x+27,y+25,'c');

lineline.width=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
lineline.color=['c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c' 'c'];


Ax=[13,16];
Ay1=[25 28]; 
Ay2=[25 23];
Ay3=[25 18];
Ay4=[20 28];
Ay5=[20 23];
Ay6=[20 18];

Bx=[18 21];
By1= [28 25];
By2= [28 20];
By3= [23 25];
By4= [23 20];
By5= [18 25];
By6= [18 20];

Cx=[23 26];
Cy1= [25 25];
Cy2= [25 20];
Cy3= [20 25];
Cy4= [20 20];

line1=line(Ax,Ay1,'LineWidth',lineline.width(1),'color',lineline.color(1)); line2=line(Ax,Ay2,'LineWidth',lineline.width(2),'color',lineline.color(2)); 
line3=line(Ax,Ay3,'LineWidth',lineline.width(3),'color',lineline.color(3)); line4=line(Ax,Ay4,'LineWidth',lineline.width(4),'color',lineline.color(4)); 
line5=line(Ax,Ay5,'LineWidth',lineline.width(5),'color',lineline.color(5)); line6=line(Ax,Ay6,'LineWidth',lineline.width(6),'color',lineline.color(6)); 
line7=line(Bx,By1,'LineWidth',lineline.width(7),'color',lineline.color(7)); line8=line(Bx,By2,'LineWidth',lineline.width(8),'color',lineline.color(8)); 
line9=line(Bx,By3,'LineWidth',lineline.width(9),'color',lineline.color(9)); line10=line(Bx,By4,'LineWidth',lineline.width(10),'color',lineline.color(10)); 
line11=line(Bx,By5,'LineWidth',lineline.width(11),'color',lineline.color(11));line12=line(Bx,By6,'LineWidth',lineline.width(12),'color',lineline.color(12)); 
line13=line(Cx,Cy1,'LineWidth',lineline.width(13),'color',lineline.color(13));line14=line(Cx,Cy2,'LineWidth',lineline.width(14),'color',lineline.color(14)); 
line15=line(Cx,Cy3,'LineWidth',lineline.width(15),'color',lineline.color(15));line16=line(Cx,Cy4,'LineWidth',lineline.width(16),'color',lineline.color(16));

theta_1 = linspace(0,pi/2);
theta_2 = linspace(pi/2,pi);
theta_3 = linspace(pi,3*(pi/2));
theta_4 = linspace(-3*(pi/2),-pi);

%% 첫, 두번쨰 트랙 성분 

R_1=5;
R_2=3;

x= 0:0.03:2;
y1=zeros(size(x));

r_x= 2:-0.03:0;
r_y1=zeros(size(r_x));

y=0:0.03:6;
y_1=0:0.03:2;

r_y= 6:-0.03:0;
r_y_11=2:-0.03:0;
 
x1=zeros(size(y));
x2=zeros(size(y_1));

r_x1=zeros(size(r_y));
r_x2=zeros(size(r_y_11));

for t_i= 1:100
    
    P_1_B(t_i,:) = R_1*[sin(theta_1(t_i)) cos(theta_1(t_i))];
    P_1_S(t_i,:) = R_2*[sin(theta_1(t_i)) cos(theta_1(t_i))];
    
    P_2_B(t_i,:) = R_1*[cos(theta_2(t_i)) sin(theta_2(t_i))];
    P_2_S(t_i,:) = R_2*[cos(theta_2(t_i)) sin(theta_2(t_i))];
    
    P_3_B(t_i,:) = R_1*[cos(theta_3(t_i)) sin(theta_3(t_i))];
    P_3_S(t_i,:) = R_2*[cos(theta_3(t_i)) sin(theta_3(t_i))];
    
    P_4_B(t_i,:) = R_1*[sin(theta_4(t_i)) cos(theta_4(t_i))];
    P_4_S(t_i,:) = R_2*[sin(theta_4(t_i)) cos(theta_4(t_i))];
end

plot(x,y1-1,'r');     %16
hold on;
plot(x,y1+1,'r');    %15


plot(P_1_B(:,1)+2,P_1_B(:,2)-4,'r');   % 14
plot(P_1_S(:,1)+2,P_1_S(:,2)-4,'r');   % 13

plot(P_3_B(:,1)+10,P_3_B(:,2)-4,'r');   % 12
plot(P_3_S(:,1)+10,P_3_S(:,2)-4,'r');   % 11
%
plot(x+10,y1-7,'r');      % 10
plot(x1+12,y-13,'r');    %  9
plot(x2+10,y_1-11,'r');  % 8

plot(r_x+10,y1-13,'r');    % 7
plot(r_x+8,y1-13,'r');     %6
plot(r_x+6,y1-13,'r');    % 5
plot(r_x+4,y1-13,'r');    %4

plot(r_x+8,y1-11,'r');   % 3
plot(r_x+6,y1-11,'r');   % 2
plot(r_x+4,y1-11,'r');   % 1

plot(P_2_B(:,1)+4,P_2_B(:,2)-16,'r');   %17
plot(P_2_S(:,1)+4,P_2_S(:,2)-16,'r');    %18

plot(x2+1,y_1-18,'r');    %19

plot(r_x-1,y1-18,'r');     %20
plot(r_x-3,y1-18,'r');    %21
plot(r_x-5,y1-18,'r');   %22

plot(r_x-3,y1-16,'r');    %23
plot(r_x-5,y1-16,'r'); %24

plot(P_3_B(:,1)-5,P_3_B(:,2)-13,'r');  %25
plot(P_3_S(:,1)-5,P_3_S(:,2)-13,'r');   %26

plot(r_x-12,y1-13,'r');     %27
plot(r_x-14,y1-13,'r');     %28

plot(x2-8,y_1-13,'r');    %29


plot(r_x-12,y1-11,'r');      %30
plot(r_x-10,y1-11,'r');      %31

plot(x1-14,y-13,'r');       %32

plot(x2-12,y_1-11,'r');     %33
plot(x2-12,y_1-9,'r');    %34


plot(x1-14,y-7,'r');       %35

plot(x1-12,y-7,'r');     %36

plot(P_2_B(:,1)-9,P_2_B(:,2)-1,'r');   %37
plot(P_2_S(:,1)-9,P_2_S(:,2)-1,'r');    %38

plot(P_4_B(:,1)-9,P_4_B(:,2)+7,'r');   % 39
plot(P_4_S(:,1)-9,P_4_S(:,2)+7,'r');   % 40

plot(P_1_B(:,1)-9,P_1_B(:,2)+7,'r');   % 41
plot(P_1_S(:,1)-9,P_1_S(:,2)+7,'r');   % 42

plot(r_x-11,y1+10,'r');      %43
plot(r_x-13,y1+10,'r');      %44
plot(r_x-15,y1+10,'r');      %45

plot(r_x-11,y1+12,'r');      %46
plot(r_x-13,y1+12,'r');      %47

plot(x1-15,y+10,'r');       %48

plot(x2-13,y_1+12,'r');     %49
plot(x2-13,y_1+14,'r');      %50

plot(P_2_B(:,1)-10,P_2_B(:,2)+16,'r');   %51
plot(P_2_S(:,1)-10,P_2_S(:,2)+16,'r');   %52

plot(r_x-10,y1+19,'r');     %53
plot(r_x-8,y1+19,'r');     %54
plot(r_x-6,y1+19,'r');     %55
plot(r_x-4,y1+19,'r');     %56

plot(r_x-10,y1+21,'r');     %57
plot(r_x-8,y1+21,'r');     %58
plot(r_x-6,y1+21,'r');     %59
plot(r_x-4,y1+21,'r');     %60
plot(r_x-2,y1+21,'r');     %61

plot(x1,y+15,'r');       %62

plot(x2-2,y_1+17,'r');     %63
plot(x2-2,y_1+15,'r');      %64

plot(P_3_B(:,1)+3,P_3_B(:,2)+15,'r');  %65
plot(P_3_S(:,1)+3,P_3_S(:,2)+15,'r');   %66

plot(r_x+3,y1+12,'r');     %67
plot(r_x+3,y1+10,'r');     %68
plot(r_x+5,y1+12,'r');     %69
plot(r_x+5,y1+10,'r');     %70
plot(r_x+7,y1+12,'r');     %71
plot(r_x+7,y1+10,'r');     %72
plot(r_x+9,y1+12,'r');     %73
plot(r_x+9,y1+10,'r');     %74

plot(P_1_B(:,1)+11,P_1_B(:,2)+7,'r');   % 75
plot(P_1_S(:,1)+11,P_1_S(:,2)+7,'r');   % 76


%% 실행 구간

plot([ -30 30 30 -30 -30], [-30 -30 30 30 -30], 'o-', 'LineWidth',5);

global CN;
CN=10;

global W;
for i= 1:CN
    W(i,:) = -7 +(14)*rand(1,16);
end

global Gen;
Gen = 1;

global color;
color = 'w';
for i = 1 : CN
    color(i,:) = 'w';
end

speed1= 0.12;
my_angle1= pi/50;

speed2 = 0.12;
my_angle2 = pi/20;

speed3 = 0.12;
my_angle3 = pi/60;

speed4= 0.12;
my_angle4= pi/60;

speed5= 0.12;
my_angle5= pi/60;

speed6= 0.12;
my_angle6= pi/60;

speed7= 0.12;
my_angle7= pi/60;

speed8= 0.12;
my_angle8= pi/60;

speed9= 0.12;
my_angle9= pi/60;

speed10= 0.12;
my_angle10= pi/60;

car10= Make_car( color(1,1), speed1, my_angle1);
car9 = Make_car( color(2,1), speed2, my_angle2);
car8 = Make_car(color(3,1), speed3, my_angle3);
car7 = Make_car( color(4,1), speed4, my_angle4);
car6 = Make_car(color(5,1), speed5, my_angle5);
car5 = Make_car( color(6,1), speed6, my_angle6);
car4 = Make_car( color(7,1), speed7, my_angle7);
car3 = Make_car(color(8,1), speed8, my_angle8);
car2 = Make_car(color(9,1), speed9, my_angle9);
car = Make_car( color(10,1), speed10, my_angle10);

axis off;

h = findobj(gca,'Color','r');
x_11 = get(h, 'xdata');
y_11 = get(h, 'ydata');

%% 첫번째 트랙 값 집어넣기
track.xdata1= [x_11{76,1} x_11{75,1} x_11{74,1} x_11{73,1} x_11{72,1} x_11{71,1} x_11{70,1} x_11{69,1} x_11{68,1}...
    x_11{67,1} x_11{66,1} x_11{65,1} x_11{64,1} x_11{63,1} x_11{62,1} x_11{61,1} x_11{60,1} x_11{59,1} x_11{58,1}...
    x_11{57,1} x_11{56,1} x_11{55,1} x_11{54,1} x_11{53,1} x_11{52,1} x_11{51,1}...
    x_11{50,1} x_11{49,1} x_11{48,1} x_11{47,1} x_11{46,1} x_11{45,1} x_11{44,1} x_11{43,1} x_11{42,1} x_11{41,1}...
    x_11{40,1} x_11{39,1} x_11{38,1} x_11{37,1} ...
    x_11{36,1} x_11{35,1} x_11{34,1} x_11{33,1} x_11{32,1} x_11{31,1} x_11{30,1} x_11{29,1} x_11{28,1} x_11{27,1} x_11{26,1} ...
    x_11{25,1} x_11{24,1} x_11{23,1} x_11{22,1} x_11{21,1} ...
    x_11{20,1} x_11{19,1} x_11{18,1} x_11{17,1} x_11{16,1} x_11{15,1}  x_11{14,1} ...
    x_11{13,1}  x_11{12,1} x_11{11,1} x_11{10,1} x_11{9,1}  x_11{8,1} x_11{7,1} x_11{6,1} x_11{5,1} x_11{4,1} x_11{3,1} ...
    x_11{2,1} x_11{1,1} ];


track.ydata1= [y_11{76,1} y_11{75,1} y_11{74,1} y_11{73,1} y_11{72,1} y_11{71,1} y_11{70,1} y_11{69,1} y_11{68,1}...
    y_11{67,1} y_11{66,1} y_11{65,1} y_11{64,1} y_11{63,1} y_11{62,1} y_11{61,1} y_11{60,1} y_11{59,1} y_11{58,1}...
    y_11{57,1} y_11{56,1} y_11{55,1} y_11{54,1} y_11{53,1} y_11{52,1} y_11{51,1}...
    y_11{50,1} y_11{49,1} y_11{48,1} y_11{47,1} y_11{46,1} y_11{45,1} y_11{44,1} y_11{43,1} y_11{42,1} y_11{41,1}...
    y_11{40,1} y_11{39,1} y_11{38,1} y_11{37,1} ...
    y_11{36,1} y_11{35,1} y_11{34,1} y_11{33,1} y_11{32,1} y_11{31,1} y_11{30,1} y_11{29,1} y_11{28,1} y_11{27,1} y_11{26,1} ...
    y_11{25,1} y_11{24,1} y_11{23,1} y_11{22,1} y_11{21,1} ...
    y_11{20,1} y_11{19,1} y_11{18,1} y_11{17,1} y_11{16,1} y_11{15,1}  y_11{14,1} ...
    y_11{13,1} y_11{12,1} y_11{11,1} y_11{10,1} y_11{9,1}  y_11{8,1} y_11{7,1} y_11{6,1} y_11{5,1} y_11{4,1} y_11{3,1} ...
    y_11{2,1} y_11{1,1} ];


track.xtrans=0;
track.ytrans=0;

handles.car = car; % 방금만든 구조체를 그냥 집어넣음
handles.car2 = car2; %%%%%%%%%%%%% 추가
handles.car3 = car3;
handles.car4 = car4;
handles.car5 = car5;
handles.car6 = car6;
handles.car7 = car7;
handles.car8 = car8;
handles.car9 = car9;
handles.car10 = car10;
handles.track = track;

handles.lineline= lineline; 

handles.line1= line1;  handles.line2= line2;
handles.line3= line3;  handles.line4= line4;
handles.line5= line5;  handles.line6= line6;
handles.line7= line7;  handles.line8= line8;
handles.line9= line9;  handles.line10= line10;
handles.line11= line11;  handles.line12= line12;
handles.line13= line13;  handles.line14= line14;
handles.line15= line15;  handles.line16= line16;

handles.timer = timer('ExecutionMode' , 'FixedRate', 'Period', 0.2,'TimerFcn', {@move_car3,hObject});

handles.moving = 0;

handles.output = hObject;
guidata(hObject, handles);

function editAnswer5_Callback(hObject, eventdata, handles)
% hObject    handle to editAnswer5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAnswer5 as text
%        str2double(get(hObject,'String')) returns contents of editAnswer5 as a double


% --- Executes during object creation, after setting all properties.
function editAnswer5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAnswer5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAnswer6_Callback(hObject, eventdata, handles)
% hObject    handle to editAnswer6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAnswer6 as text
%        str2double(get(hObject,'String')) returns contents of editAnswer6 as a double


% --- Executes during object creation, after setting all properties.
function editAnswer6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAnswer6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
