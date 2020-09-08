function varargout = main_car_track2(varargin)

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

% Last Modified by GUIDE v2.5 08-Nov-2018 20:25:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @main_car_track2_OpeningFcn, ...
    'gui_OutputFcn',  @main_car_track2_OutputFcn, ...
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
function main_car_track2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bounce_car (see VARARGIN)

% %%트랙 만들기
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
t_1_x = [1.2 1.6 1.6 1.2];
t_1_y = [1 1 1.25 1.25];
m_1_x = [1 1.8 1.4];
m_1_y = [1.25 1.25 1.7];

t_2_x = [0.3 0.7 0.7 0.3];
t_2_y = [1 1 1.25 1.25];
m_2_x = [0.1 0.9 0.5];
m_2_y = [1.25 1.25 1.7];

t_3_x = [2.1 2.5 2.5 2.1];
t_3_y = [1 1 1.25 1.25];
m_3_x = [1.9 2.7 2.3];
m_3_y = [1.25 1.25 1.7];

t_4_x = [0.3 0.7 0.7 0.3];
t_4_y = [-1 -1 -1.25 -1.25];
m_4_x = [0.1 0.9 0.5];
m_4_y = [-1.25 -1.25 -1.7];

t_5_x = [1.2 1.6 1.6 1.2];
t_5_y = [-1 -1 -1.25 -1.25];
m_5_x = [1 1.8 1.4];
m_5_y = [-1.25 -1.25 -1.7];

t_6_x = [2.1 2.5 2.5 2.1];
t_6_y = [-1 -1 -1.25 -1.25];
m_6_x = [1.9 2.7 2.3];
m_6_y = [-1.25 -1.25 -1.7];

t_7_x = [3.0 3.4 3.4 3.0];
t_7_y = [1 1 1.25 1.25];
m_7_x = [2.8 3.6 3.2];
m_7_y = [1.25 1.25 1.7];

t_8_x = [3.0 3.4 3.4 3.0];
t_8_y = [-1 -1 -1.25 -1.25];
m_8_x = [2.8 3.6 3.2];
m_8_y = [-1.25 -1.25 -1.7];

t_9_x = [-3.7 -3.3 -3.3 -3.7];
t_9_y = [13 13 13.25 13.25];
m_9_x = [-3.9 -3.1 -3.5];
m_9_y = [13.25 13.25 13.7];

t_10_x = [-2.8 -2.4 -2.4 -2.8];
t_10_y = [ 10.75 10.75 11 11];
m_10_x = [-3.0 -2.2 -2.6];
m_10_y = [10.75 10.75 10.3];

t_11_x = [-1.9 -1.5 -1.5 -1.9];
t_11_y = [13 13 13.25 13.25];
m_11_x = [-2.1 -1.3 -1.7];
m_11_y = [13.25 13.25 13.7];

t_12_x = [-1.0 -0.6 -0.6 -1];
t_12_y = [ 10.75 10.75 11 11];
m_12_x = [-1.2 -0.4 -0.8];
m_12_y = [10.75 10.75 10.3];

t_13_x = [-0.1 0.3 0.3 -0.1];
t_13_y = [13 13 13.25 13.25];
m_13_x = [-0.3 0.5 0.1];
m_13_y = [13.25 13.25 13.7];

t_14_x = [0.8 1.2 1.2 0.8];
t_14_y = [ 10.75 10.75 11 11];
m_14_x = [0.6 1.4 1.0];
m_14_y = [10.75 10.75 10.3];

t_15_x = [1.7 2.1 2.1 1.7];
t_15_y = [13 13 13.25 13.25];
m_15_x = [1.5 2.3 1.9];
m_15_y = [13.25 13.25 13.7];

t_16_x = [2.6 3.0 3.0 2.6];
t_16_y = [ 10.75 10.75 11 11];
m_16_x = [2.4 3.2 2.8];
m_16_y = [10.75 10.75 10.3];

%두번째 신호등 주위 나무
% t_17_x = [ -5.8 -5.4 -5.4 -5.8]; 
% t_17_y = [ 23 23 23.25 23.25];
% m_17_x = [-6 -5.2 -5.6];
% m_17_y = [23.25 23.25 23.7];

% t_18_x = [ -4.9 -4.5 -4.5 -4.9];
% t_18_y = [ 23 23 23.25 23.25];
% m_18_x = [-5.1 -4.3 -4.7];
% m_18_y = [23.25 23.25 23.7];

t_19_x = [ -4.0 -3.6 -3.6 -4.0];
t_19_y = [ 23 23 23.25 23.25];
m_19_x = [-4.2 -3.4 -3.8];
m_19_y = [23.25 23.25 23.7];

t_20_x = [ -3.1 -2.7 -2.7 -3.1];
t_20_y = [ 23 23 23.25 23.25];
m_20_x = [-3.3 -2.5 -2.9];
m_20_y = [23.25 23.25 23.7];

t_21_x = [ -2.2 -1.8 -1.8 -2.2];
t_21_y = [ 23 23 23.25 23.25];
m_21_x = [-2.4 -1.6 -2.0];
m_21_y = [23.25 23.25 23.7];

t_22_x = [ -1.3 -0.9 -0.9 -1.3];
t_22_y = [ 23 23 23.25 23.25];
m_22_x = [-1.5 -0.7 -1.1];
m_22_y = [23.25 23.25 23.7];

t_23_x = [ -0.4 0 0 -0.4];
t_23_y = [ 23 23 23.25 23.25];
m_23_x = [-0.6 0.2 -0.2];
m_23_y = [23.25 23.25 23.7];

t_24_x = [ 8.2 8.6 8.6 8.2];
t_24_y = [10.75 10.75 11 11];
m_24_x = [8 8.8 8.4];
m_24_y = [10.75 10.75 10.3];

t_25_x = [ 9.1 9.5 9.5 9.1];
t_25_y = [10.75 10.75 11 11];
m_25_x = [8.9 9.7 9.3];
m_25_y = [10.75 10.75 10.3];

t_26_x = [ 10 10.4 10.4 10];
t_26_y = [10.75 10.75 11 11];
m_26_x = [9.8 10.6 10.2];
m_26_y = [10.75 10.75 10.3];

t_27_x = [ 10.9 11.3 11.3 10.9];
t_27_y = [10.75 10.75 11 11];
m_27_x = [10.7 11.5 11.1];
m_27_y = [10.75 10.75 10.3];

t_28_x = [ 10.2 10.6 10.6 10.2];
t_28_y = [13 13 13.25 13.25];
m_28_x = [10 10.8 10.4];
m_28_y = [13.25 13.25 13.7];

t_29_x = [ 11.1 11.5 11.5 11.1];
t_29_y = [13 13 13.25 13.25];
m_29_x = [10.9 11.7 11.3];
m_29_y = [13.25 13.25 13.7];

t_30_x = [ 12 12.4 12.4 12];
t_30_y = [13 13 13.25 13.25];
m_30_x = [11.8 12.6 12.2];
m_30_y = [13.25 13.25 13.7];

t_31_x = [ 12.9 13.3 13.3 12.9];
t_31_y = [13 13 13.25 13.25];
m_31_x = [12.7 13.5 13.1];
m_31_y = [13.25 13.25 13.7];

t_32_x = [0.1 0.5 0.5 0.1];
t_32_y = [-4 -4 -3.75 -3.75];
m_32_x = [-0.1 0.7 0.3];
m_32_y = [-3.75 -3.75 -3.3];

t_33_x = [ -0.8  -0.4 -0.4 -0.8];
t_33_y = [-4 -4 -3.75 -3.75];
m_33_x = [ -1 -0.2 -0.6];
m_33_y = [-3.75 -3.75 -3.3];

t_34_x = [1.0 1.4 1.4 1.0];
t_34_y = [-4 -4 -3.75 -3.75];
m_34_x = [0.8 1.6 1.2];
m_34_y = [-3.75 -3.75 -3.3];

t_35_x = [1.9  2.3 2.3 1.9];
t_35_y = [-4 -4 -3.75 -3.75];
m_35_x = [1.7 2.5 2.1];
m_35_y = [-3.75 -3.75 -3.3];

t_36_x = [2.7  3.1 3.1 2.7];
t_36_y = [-4 -4 -3.75 -3.75];
m_36_x = [2.5 3.3 2.9];
m_36_y = [-3.75 -3.75 -3.3];

t_37_x = [3.6  4.0 4.0 3.6];
t_37_y = [-4 -4 -3.75 -3.75];
m_37_x = [3.4 4.2 3.8];
m_37_y = [-3.75 -3.75 -3.3];

t_38_x = [4.5  4.9 4.9 4.5];
t_38_y = [-4 -4 -3.75 -3.75];
m_38_x = [4.3 5.1 4.7];
m_38_y = [-3.75 -3.75 -3.3];

t_39_x = [5.4  5.8 5.8 5.4];
t_39_y = [-4 -4 -3.75 -3.75];
m_39_x = [5.2 6.0 5.6];
m_39_y = [-3.75 -3.75 -3.3];

t_40_x = [6.3  6.7 6.7 6.3];
t_40_y = [-4 -4 -3.75 -3.75];
m_40_x = [6.1 6.9 6.5];
m_40_y = [-3.75 -3.75 -3.3];

t_41_x = [-6.8 -6.4 -6.4 -6.8];
t_41_y = [-12 -12 -12.25 -12.25];
m_41_x = [-7 -6.2 -6.6];
m_41_y = [-12.25 -12.25 -12.7];

t_42_x = [-5.9 -5.5 -5.5 -5.9];
t_42_y = [-12 -12 -12.25 -12.25];
m_42_x = [-6.1 -5.3 -5.7];
m_42_y = [-12.25 -12.25 -12.7];

t_43_x = [-5.0 -4.6 -4.6 -5.0];
t_43_y = [-12 -12 -12.25 -12.25];
m_43_x = [-5.2 -4.4 -4.8];
m_43_y = [-12.25 -12.25 -12.7];

t_44_x = [-4.1 -3.7 -3.7 -4.1];
t_44_y = [-12 -12 -12.25 -12.25];
m_44_x = [-4.3 -3.5 -3.9];
m_44_y = [-12.25 -12.25 -12.7];

t_45_x = [-3.2 -2.8 -2.8 -3.2];
t_45_y = [-12 -12 -12.25 -12.25];
m_45_x = [-3.4 -2.6 -3.0];
m_45_y = [-12.25 -12.25 -12.7];

t_46_x = [-2.3 -1.9 -1.9 -2.3];
t_46_y = [-12 -12 -12.25 -12.25];
m_46_x = [-2.5 -1.7 -2.1];
m_46_y = [-12.25 -12.25 -12.7];

t_47_x = [-1.4 -1.0 -1.0 -1.4];
t_47_y = [-12 -12 -12.25 -12.25];
m_47_x = [-1.6 -0.8 -1.2];
m_47_y = [-12.25 -12.25 -12.7];

t_48_x = [-0.5 -0.1 -0.1 -0.5];
t_48_y = [-12 -12 -12.25 -12.25];
m_48_x = [-0.7 0.1 -0.3];
m_48_y = [-12.25 -12.25 -12.7];

t_49_x = [0.4 0.8 0.8 0.4];
t_49_y = [-12 -12 -12.25 -12.25];
m_49_x = [0.2 1.0 0.6];
m_49_y = [-12.25 -12.25 -12.7];

color123 = [0.5 0.2 0.2];


a1 = patch(t_1_x,t_1_y,color123);
hold on;
b1 = patch(m_1_x, m_1_y, 'g');
a2 = patch(t_2_x,t_2_y,color123);
b2 = patch(m_2_x, m_2_y, 'g');
a3 = patch(t_3_x,t_3_y,color123);
b3 = patch(m_3_x, m_3_y, 'g');
a4 = patch(t_4_x,t_4_y,color123);
b4 = patch(m_4_x, m_4_y, 'g');
a5 = patch(t_5_x,t_5_y,color123);
b5 = patch(m_5_x, m_5_y, 'g');
a6 = patch(t_6_x,t_6_y,color123);
b6 = patch(m_6_x, m_6_y, 'g');
a7 = patch(t_7_x,t_7_y,color123);
b7 = patch(m_7_x, m_7_y, 'g');
a8 = patch(t_8_x,t_8_y,color123);
b8 = patch(m_8_x, m_8_y, 'g');
a9 = patch(t_9_x,t_9_y,color123);
b9 = patch(m_9_x, m_9_y, 'g');
a10 = patch(t_10_x,t_10_y,color123);
b10 = patch(m_10_x, m_10_y, 'g');
a11 = patch(t_11_x,t_11_y,color123);
b11 = patch(m_11_x, m_11_y, 'g');
a12 = patch(t_12_x,t_12_y,color123);
b12 = patch(m_12_x, m_12_y, 'g');
a13 = patch(t_13_x,t_13_y,color123);
b13 = patch(m_13_x, m_13_y, 'g');
a14 = patch(t_14_x,t_14_y,color123);
b14 = patch(m_14_x, m_14_y, 'g');
a15 = patch(t_15_x,t_15_y,color123);
b15 = patch(m_15_x, m_15_y, 'g');
a16 = patch(t_16_x,t_16_y,color123);
b16 = patch(m_16_x, m_16_y, 'g');
% a17 = patch(t_17_x,t_17_y,color123); % 2번째 신호등 주위 나무
% b17 = patch(m_17_x, m_17_y, 'g');
% a18 = patch(t_18_x,t_18_y,color123);
% b18 = patch(m_18_x, m_18_y, 'g');
a19 = patch(t_19_x,t_19_y,color123);
b19 = patch(m_19_x,m_19_y, 'g');
a20 = patch(t_20_x,t_20_y,color123);
b20 = patch(m_20_x,m_20_y, 'g');
a21 = patch(t_21_x,t_21_y,color123);
b21 = patch(m_21_x,m_21_y, 'g');
a22 = patch(t_22_x,t_22_y,color123);
b22 = patch(m_22_x,m_22_y, 'g');
a23 = patch(t_23_x,t_23_y,color123);
b23 = patch(m_23_x,m_23_y, 'g');
a24 = patch(t_24_x,t_24_y,color123);
b24 = patch(m_24_x,m_24_y, 'g');
a25 = patch(t_25_x,t_25_y,color123);
b25 = patch(m_25_x,m_25_y, 'g');
a26 = patch(t_26_x,t_26_y,color123);
b26 = patch(m_26_x,m_26_y, 'g');
a27 = patch(t_27_x,t_27_y,color123);
b27 = patch(m_27_x,m_27_y, 'g');
a28 = patch(t_28_x,t_28_y,color123);
b28 = patch(m_28_x,m_28_y, 'g');
a29 = patch(t_29_x,t_29_y,color123);
b29 = patch(m_29_x,m_29_y, 'g');
a30 = patch(t_30_x,t_30_y,color123);
b30 = patch(m_30_x,m_30_y, 'g');
a31 = patch(t_31_x,t_31_y,color123);
b31 = patch(m_31_x,m_31_y, 'g');
a32 = patch(t_32_x,t_32_y,color123);
b32 = patch(m_32_x,m_32_y, 'g');
a33 = patch(t_33_x,t_33_y,color123);
b33 = patch(m_33_x,m_33_y, 'g');
a34 = patch(t_34_x,t_34_y,color123);
b34 = patch(m_34_x,m_34_y, 'g');
a35 = patch(t_35_x,t_35_y,color123);
b35 = patch(m_35_x,m_35_y, 'g');
a36 = patch(t_36_x,t_36_y,color123);
b36 = patch(m_36_x,m_36_y, 'g');
a37 = patch(t_37_x,t_37_y,color123);
b37 = patch(m_37_x,m_37_y, 'g');
a38 = patch(t_38_x,t_38_y,color123);
b38 = patch(m_38_x,m_38_y, 'g');
a39 = patch(t_39_x,t_39_y,color123);
b39 = patch(m_39_x,m_39_y, 'g');
a40 = patch(t_40_x,t_40_y,color123);
b40 = patch(m_40_x,m_40_y, 'g');
a41 = patch(t_41_x, t_41_y,color123);
b41 = patch(m_41_x, m_41_y, 'g');
a42 = patch(t_42_x, t_42_y,color123);
b42 = patch(m_42_x, m_42_y, 'g');
a43 = patch(t_43_x, t_43_y,color123);
b43 = patch(m_43_x, m_43_y, 'g');
a44 = patch(t_44_x, t_44_y,color123);
b44 = patch(m_44_x, m_44_y, 'g');
a45 = patch(t_45_x, t_45_y,color123);
b45 = patch(m_45_x, m_45_y, 'g');
a46 = patch(t_46_x, t_46_y,color123);
b46 = patch(m_46_x, m_46_y, 'g');
a47 = patch(t_47_x, t_47_y,color123);
b47 = patch(m_47_x, m_47_y, 'g');
a48 = patch(t_48_x, t_48_y,color123);
b48 = patch(m_48_x, m_48_y, 'g');
a49 = patch(t_49_x, t_49_y,color123);
b49 = patch(m_49_x, m_49_y, 'g');

%% track2
plot(x,y1-1,'k');     %1
% hold on;
plot(x,y1+1,'k');    %2

plot(x+2,y1-1,'k');     %3
plot(x+2,y1+1,'k');    %4

plot(x+4,y1-1,'k');     %5

plot(x1+6,y-1,'k');    %  6
plot(x2+4,y_1+1,'k');  % 7
plot(x2+4,y_1+3,'k');  % 8

plot(x1+4,y+5,'k');    %  9
plot(x1+6,y+5,'k');    %  10
plot(x2+6,y_1+11,'k');  % 11

plot(x+4,y1+13,'k');     %12

plot(x+2,y1+11,'k');     %13
plot(x+2,y1+13,'k');     %14

plot(x,y1+11,'k');     %15
plot(x,y1+13,'k');     %16

plot(x-2,y1+11,'k');     %17
plot(x-2,y1+13,'k');     %18

plot(x-4,y1+11,'k');     %19
plot(x-4,y1+13,'k');     %20

plot(x-6,y1+11,'k');     %21

plot(x1-6,y+11,'k');    %  22

plot(x1-4,y+13,'k');    %  23
plot(x1-6,y+17,'k');    %  24
plot(x2-4,y_1+19,'k');  % 25

plot(x-6,y1+23,'k');     %26
plot(x-4,y1+23,'k');     %27
plot(x-2,y1+23,'k');     %28

plot(x-4,y1+21,'k');     %29

plot(x2-2,y_1+19,'k');  % 30

plot(x2,y_1+21,'k');  % 31

plot(x-2,y1+19,'k');     %32
plot(x,y1+19,'k');     %33
plot(x+2,y1+19,'k');     %34
plot(x+4,y1+19,'k');     %35
plot(x+6,y1+19,'k');     %36


plot(x,y1+21,'k');     %37
plot(x+2,y1+21,'k');     %38
plot(x+4,y1+21,'k');     %39
plot(x+6,y1+21,'k');     %40
plot(x+8,y1+21,'k');     %41

plot(x1+10,y+15,'k');    %  42
plot(x2+10,y_1+13,'k');  % 43

plot(x1+8,y+13,'k');    %  44
plot(x2+8,y_1+11,'k');  % 45

plot(x+8,y1+11,'k');     %46
plot(x+10,y1+11,'k');     %47

plot(x+10,y1+13,'k');     %48
plot(x+12,y1+13,'k');     %49

plot(x1+14,y+7,'k');    %  50
plot(x1+14,y+1,'k');    %  51
plot(x1+14,y-5,'k');    %  52

plot(x1+12,y+5,'k');    %  53
plot(x1+12,y-1,'k');    %  54
plot(x2+12,y_1-3,'k');  % 55
plot(x2+12,y_1-5,'k');  % 56

plot(P_4_B(:,1)+9,P_4_B(:,2)-5,'k');   % 57
plot(P_4_S(:,1)+9,P_4_S(:,2)-5,'k');   % 58

plot(x+7,y1-10,'k');     %59
plot(x+5,y1-10,'k');     %60

plot(x+7,y1-8,'k');     %61

plot(x2+5,y_1-8,'k');  % 62
plot(x2+5,y_1-10,'k');  % 63

plot(x2+7,y_1-6,'k');  % 64
plot(x2+7,y_1-8,'k');  % 65

plot(x+5,y1-4,'k');     %66
plot(x+3,y1-4,'k');     %67
plot(x+1,y1-4,'k');     %68
plot(x-1,y1-4,'k');     %69

plot(x+3,y1-6,'k');     %70
plot(x+1,y1-6,'k');     %71

plot(x1+1,y-12,'k');    %  72
plot(x1-1,y-10,'k');    %  73

plot(x-1,y1-12,'k');     %74
plot(x-3,y1-12,'k');     %75
plot(x-5,y1-12,'k');     %76
plot(x-7,y1-12,'k');     %77

plot(x-3,y1-10,'k');     %78
plot(x-5,y1-10,'k');     %79

plot(x2-7,y_1-12,'k');  % 80
plot(x2-7,y_1-10,'k');  % 81

plot(x2-5,y_1-10,'k');  % 82

plot(x2-5,y_1-8,'k');  % 83

plot(x2-7,y_1-8,'k');  % 84

%%
plot([ -15 25 25 -15 -15], [-15 -15 25 25 -15], 'o-', 'LineWidth',5);

%% 신호등 몸체
box_up_x = [3.5 6 6 3.5];
box_up_y = [14.5 14.5 16 16];

box_down_x = [4.5 5 5 4.5];
box_down_y = [13.5 13.5 14.5 14.5];

boxcolor = [0.7 0.7 0.7];
box_up.p= patch(box_up_x, box_up_y, boxcolor);
box_down.p = patch(box_down_x, box_down_y, boxcolor);

box_up_x2 = [-6.2 -3.7 -3.7 -6.2];
box_up_y2 = [24 24 25.5 25.5];

box_down_x2 = [-5.2 -4.7 -4.7 -5.2];
box_down_y2 = [23 23 24 24];

box_up2.p= patch(box_up_x2, box_up_y2, boxcolor);
box_down2.p = patch(box_down_x2, box_down_y2, boxcolor);

%%추가
global CN;
CN=10;

global W;
%W = xlsread('saveW.xlsx');
W = [-0.6395    1.9594    1.0612   -1.7544   -1.0914   -2.1971    1.0288    0.4259   -1.9814   -2.1141   -0.1435    2.4486    0.3131  -2.8024   -2.6768    1.8304];

color1='w';
speed1= 0.12;
my_angle1= pi/50;

global cnt;
cnt = 0;

global flag;
flag = 0;

global color_timer1;
global color_timer2;
color_timer1 = 'k';
color_timer2 = 'r';
Signal_light = Make_Signal_light(color_timer1, color_timer2);
car = Make_car2(color1, speed1, my_angle1);

%%

axis off;

h = findobj(gca,'Color', 'k');
x_11 = get(h, 'xdata');
y_11 = get(h, 'ydata');

hh = findobj('Type', 'patch', 'FaceColor', 'r');
x_33 = get(hh, 'xdata');
y_33 = get(hh, 'ydata');

track.signal_x = x_33;
track.signal_y = y_33;

hhh = findobj('Type', 'patch', 'FaceColor', [0.98 0 0]);
x_333 = get(hhh, 'xdata');
y_333 = get(hhh, 'ydata');

track.signal_x2 = x_333;
track.signal_y2 = y_333;

track.xdata1= [x_11{84,1} x_11{83,1} x_11{82,1} x_11{81,1} x_11{80,1} x_11{79,1} x_11{78,1} x_11{77,1} ...
    x_11{76,1} x_11{75,1} x_11{74,1} x_11{73,1} x_11{72,1} x_11{71,1} x_11{70,1} x_11{69,1} x_11{68,1}...
    x_11{67,1} x_11{66,1} x_11{65,1} x_11{64,1} x_11{63,1} x_11{62,1} x_11{61,1} x_11{60,1} x_11{59,1} x_11{58,1}...
    x_11{57,1} x_11{56,1} x_11{55,1} x_11{54,1} x_11{53,1} x_11{52,1} x_11{51,1}...
    x_11{50,1} x_11{49,1} x_11{48,1} x_11{47,1} x_11{46,1} x_11{45,1} x_11{44,1} x_11{43,1} x_11{42,1} x_11{41,1}...
    x_11{40,1} x_11{39,1} x_11{38,1} x_11{37,1} ...
    x_11{36,1} x_11{35,1} x_11{34,1} x_11{33,1} x_11{32,1} x_11{31,1} x_11{30,1} x_11{29,1} x_11{28,1} x_11{27,1} x_11{26,1} ...
    x_11{25,1} x_11{24,1} x_11{23,1} x_11{22,1} x_11{21,1} ...
    x_11{20,1} x_11{19,1} x_11{18,1} x_11{17,1} x_11{16,1} x_11{15,1}  x_11{14,1} ...
    x_11{13,1}  x_11{12,1} x_11{11,1} x_11{10,1} x_11{9,1}  x_11{8,1} x_11{7,1} x_11{6,1} x_11{5,1} x_11{4,1} x_11{3,1} ...
    x_11{2,1} x_11{1,1} ];

track.ydata1= [ y_11{84,1} y_11{83,1} y_11{82,1} y_11{81,1} y_11{80,1} y_11{79,1} y_11{78,1} y_11{77,1} ...
    y_11{76,1} y_11{75,1} y_11{74,1} y_11{73,1} y_11{72,1} y_11{71,1} y_11{70,1} y_11{69,1} y_11{68,1}...
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
handles.track = track;
handles.Signal_light = Signal_light;

handles.timer = timer('ExecutionMode' , 'FixedRate', 'Period', 0.025,'TimerFcn', {@move_car2,hObject});

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
function varargout = main_car_track2_OutputFcn(hObject, eventdata, handles)
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
