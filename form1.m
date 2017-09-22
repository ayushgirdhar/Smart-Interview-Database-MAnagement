function varargout = form1(varargin)
global i;
global k;
global vid;
% FORM1 MATLAB code for form1.fig
%      FORM1, by itself, creates a new FORM1 or raises the existing
%      singleton*.
%
%      H = FORM1 returns the handle to a new FORM1 or the handle to
%      the existing singleton*.
%
%      FORM1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORM1.M with the given input arguments.
%
%      FORM1('Property','Value',...) creates a new FORM1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before form1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to form1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help form1

% Last Modified by GUIDE v2.5 04-Oct-2016 10:53:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @form1_OpeningFcn, ...
                   'gui_OutputFcn',  @form1_OutputFcn, ...
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


% --- Executes just before form1 is made visible.
function form1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to form1 (see VARARGIN)

% Choose default command line output for form1
    handles.output = hObject;
    global i;
    global k;
    [~,~,m]=xlsread('interview.xlsx','sheet1');
    sc=size(m);
    i=sc(1);
    k=sc(1);
%    axes(handles.logo1);
%    imshow('logo.png');
    imaqreset;
    l=num2str(k);
    set(handles.text10,'string',l);
    global vid
    vid=videoinput('winvideo',1);
    set(vid,'ReturnedColorSpace','RGB')
    set(vid,'FramesPertrigger',1);
    set(vid,'TriggerRepeat',Inf);
    set
    triggerconfig(vid,'manual');
    axes(handles.video1);
    start(vid);
    while(1)
        trigger(vid);
        im=getdata(vid);
        imshow(im);

    end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes form1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = form1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function name1_Callback(hObject, eventdata, handles)
% hObject    handle to name1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name1 as text
%        str2double(get(hObject,'String')) returns contents of name1 as a double


% --- Executes during object creation, after setting all properties.
function name1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in capture1.
function capture1_Callback(hObject, eventdata, handles)
% hObject    handle to capture1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 F = getframe(handles.video1);
Image = frame2im(F);
imwrite(Image, 'Image.jpg')
 axes(handles.photo1);
   imshow('Image.jpg');
 axes(handles.video1);

% --- Executes on button press in retake1.
function retake1_Callback(hObject, eventdata, handles)
% hObject    handle to retake1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 F = getframe(handles.video1);
Image = frame2im(F);
imwrite(Image, 'Image.jpg')
 axes(handles.photo1);
   imshow('Image.jpg');
 axes(handles.video1);


function branch1_Callback(hObject, eventdata, handles)
% hObject    handle to branch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of branch1 as text
%        str2double(get(hObject,'String')) returns contents of branch1 as a double


% --- Executes during object creation, after setting all properties.
function branch1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to branch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function year1_Callback(hObject, eventdata, handles)
% hObject    handle to year1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of year1 as text
%        str2double(get(hObject,'String')) returns contents of year1 as a double


% --- Executes during object creation, after setting all properties.
function year1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to year1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function shift1_Callback(hObject, eventdata, handles)
% hObject    handle to shift1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shift1 as text
%        str2double(get(hObject,'String')) returns contents of shift1 as a double


% --- Executes during object creation, after setting all properties.
function shift1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shift1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function number1_Callback(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num as text
%        str2double(get(hObject,'String')) returns contents of num as a double


% --- Executes during object creation, after setting all properties.
function num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function id1_Callback(hObject, eventdata, handles)
% hObject    handle to id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of id as text
%        str2double(get(hObject,'String')) returns contents of id as a double


% --- Executes during object creation, after setting all properties.
function id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in submit1.
function submit1_Callback(hObject, eventdata, handles)
% hObject    handle to submit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=get(handles.name1,'string');
b=get(handles.branch1,'string');
y=get(handles.year1,'string');
s=get(handles.shift1,'string');
p=get(handles.number1,'string');
e=get(handles.id1,'string');
F = getframe(handles.video1);
Image = frame2im(F);
pic=strcat(n,'_',b,'_',y,'.jpg');
imwrite(Image, pic);
global i;
global k;
l=num2str(k);
z=strcat('Please remeber your UID:',l);
x={l,n,b,y,s,p,e};
j=num2str(i);
loc=strcat('A',j);
xlswrite('interview.xlsx',x,1,loc);
set(handles.name1,'string',[]);
set(handles.branch1,'string',[]);
set(handles.year1,'string',[]);
set(handles.shift1,'string',[]);
set(handles.number1,'string',[]);
set(handles.id1,'string',[]);
i=i+1;
k=k+1;
