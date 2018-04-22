function varargout = zadanie2Gui(varargin)
% ZADANIE2GUI MATLAB code for zadanie2Gui.fig
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
%      applied to the GUI before zadanie2Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zadanie2Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zadanie2Gui

% Last Modified by GUIDE v2.5 22-Apr-2018 22:16:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zadanie2Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @zadanie2Gui_OutputFcn, ...
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


% --- Executes just before zadanie2Gui is made visible.
function zadanie2Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zadanie2Gui (see VARARGIN)

% Choose default command line output for zadanie2Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zadanie2Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zadanie2Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function functionEdit_Callback(hObject, eventdata, handles)
% hObject    handle to functionEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of functionEdit as text
%        str2double(get(hObject,'String')) returns contents of functionEdit as a double


% --- Executes during object creation, after setting all properties.
function functionEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to functionEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function startMatrix_Callback(hObject, eventdata, handles)
% hObject    handle to startMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startMatrix as text
%        str2double(get(hObject,'String')) returns contents of startMatrix as a double


% --- Executes during object creation, after setting all properties.
function startMatrix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startMatrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in is2DRadioButton.
function is2DRadioButton_Callback(hObject, eventdata, handles)
% hObject    handle to is2DRadioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of is2DRadioButton


% --- Executes on button press in isIterationShowRadioButton.
function isIterationShowRadioButton_Callback(hObject, eventdata, handles)
% hObject    handle to isIterationShowRadioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isIterationShowRadioButton


% --- Executes on button press in findBtn.
function findBtn_Callback(hObject, eventdata, handles)
% hObject    handle to findBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

V1 = [-6 0 -2; 
    -4 2 5; 
    2 4 1;
    3 -1 2];
V2 = [1 2;
    1 -3;
    -2 1];

if get(handles.is2DRadioButton,'Value')== 1
Fx = get(handles.functionEdit,'String')
X1 = get(handles.startMatrix, 'String')
rN = get(handles.rowEdit,'String')
cN = get(handles.columnEdit,'String')
show = get(handles.isIterationShowRadioButton, 'Value')
if get(handles.matrixRadioButton,'Value')==0
InitFunc(Fx,X1,show,rN,cN)
else
DefaultInitFunc(Fx,V2,1)
end
else
Fx = get(handles.functionEdit,'String')
X1 = get(handles.startMatrix, 'String')
rN = get(handles.rowEdit,'String')
cN = get(handles.columnEdit,'String')
show = get(handles.isIterationShowRadioButton, 'Value')
if get(handles.matrixRadioButton,'Value')==0
InitFunc2(Fx,X1,show,rN,cN)
else
DefaultInitFunc(Fx,V1,0)
end
end



function rowEdit_Callback(hObject, eventdata, handles)
% hObject    handle to rowEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rowEdit as text
%        str2double(get(hObject,'String')) returns contents of rowEdit as a double


% --- Executes during object creation, after setting all properties.
function rowEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rowEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function columnEdit_Callback(hObject, eventdata, handles)
% hObject    handle to columnEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of columnEdit as text
%        str2double(get(hObject,'String')) returns contents of columnEdit as a double


% --- Executes during object creation, after setting all properties.
function columnEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to columnEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in matrixRadioButton.
function matrixRadioButton_Callback(hObject, eventdata, handles)
% hObject    handle to matrixRadioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of matrixRadioButton
