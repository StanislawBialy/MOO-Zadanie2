function varargout = zadanie2GUI(varargin)
% ZADANIE2GUI MATLAB code for zadanie2GUI.fig
%      ZADANIE2GUI, by itself, creates a new ZADANIE2GUI or raises the existing
%      singleton*.
%
%      H = ZADANIE2GUI returns the handle to a new ZADANIE2GUI or the handle to
%      the existing singleton*.
%
%      ZADANIE2GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZADANIE2GUI.M with the given input arguments.
%
%      ZADANIE2GUI('Property','Value',...) creates a new ZADANIE2GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zadanie2GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zadanie2GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zadanie2GUI

% Last Modified by GUIDE v2.5 04-May-2018 16:41:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zadanie2GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @zadanie2GUI_OutputFcn, ...
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


% --- Executes just before zadanie2GUI is made visible.
function zadanie2GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zadanie2GUI (see VARARGIN)

% Choose default command line output for zadanie2GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zadanie2GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zadanie2GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editFunction_Callback(hObject, eventdata, handles)
% hObject    handle to editFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFunction as text
%        str2double(get(hObject,'String')) returns contents of editFunction as a double


% --- Executes during object creation, after setting all properties.
function editFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonRun.
function pushbuttonRun_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fx = get(handles.editFunction,'String');
sv = get(handles.editStartValue,'String');
rv = get(handles.editRangeValue,'String');
dv = get(handles.editDimensionValue,'String');
F = str2func(Fx);

V = odnajdywanieWiezcholkow(str2num(sv),str2num(rv),str2num(dv));

if(str2num(dv))==2
[V0,y0,dV,dy]=sumpleksFunkcjaDwuwymiarowa(F,V,10,40,0.002,1);

str1 = mat2str(V0);
str2 = mat2str(y0);
str3 = mat2str(dV);
str4 = mat2str(dy);

set(handles.textWM,'String',str1);
set(handles.textWFinMin,'String',str2);
set(handles.textRSW,'String',str3);
set(handles.textError,'String',str4);
else
 [V0,y0,dV,dy,V]=sumpleksFunkcjaWielowymiarowa(F,V,100,400,0.002,1);
 
[lenX,lenY] = size(V);
length = lenX*lenY;
 
% for c = 1:length
%     str5 = 
% end

str1 = mat2str(V0);
str2 = num2str(y0);
str3 = num2str(dV);
str4 = num2str(dy);


set(handles.textWM,'String',str1);
set(handles.textWFinMin,'String',str2);
set(handles.textRSW,'String',str3);
set(handles.textError,'String',str4);
% set(handles.textSimplex,'String',str5);

end





function editStartValue_Callback(hObject, eventdata, handles)
% hObject    handle to editStartValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editStartValue as text
%        str2double(get(hObject,'String')) returns contents of editStartValue as a double


% --- Executes during object creation, after setting all properties.
function editStartValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editStartValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRangeValue_Callback(hObject, eventdata, handles)
% hObject    handle to editRangeValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRangeValue as text
%        str2double(get(hObject,'String')) returns contents of editRangeValue as a double


% --- Executes during object creation, after setting all properties.
function editRangeValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRangeValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDimensionValue_Callback(hObject, eventdata, handles)
% hObject    handle to editDimensionValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDimensionValue as text
%        str2double(get(hObject,'String')) returns contents of editDimensionValue as a double


% --- Executes during object creation, after setting all properties.
function editDimensionValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDimensionValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editAdditionalFunc_Callback(hObject, eventdata, handles)
% hObject    handle to editAdditionalFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAdditionalFunc as text
%        str2double(get(hObject,'String')) returns contents of editAdditionalFunc as a double


% --- Executes during object creation, after setting all properties.
function editAdditionalFunc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAdditionalFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
