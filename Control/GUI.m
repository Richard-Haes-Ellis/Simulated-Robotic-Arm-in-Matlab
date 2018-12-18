function varargout = GUI(varargin)
%GUI MATLAB code file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 18-Dec-2018 00:47:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
load('modeloIdeal.mat');
handles.R=R;
handles.Kt=Kt;
handles.M_num=M_num;
handles.V_num=V_num;
handles.G_num=G_num;
guidata(hObject,handles);

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in control1.
function control1_Callback(hObject, eventdata, handles)


function models = lineariz()
if(strcmp(control,'Normal')
syms qd1 qd2 qd3 real
B1 = diff(V_num(1),qd1);
B2 = diff(V_num(2),qd2);    
B3 = diff(V_num(3),qd3);
        
q1  = 0; q2  = 0; q3  = 0;
qd1 = 0; qd2 = 0; qd3 = 0;
        
A1 = eval(M_num(1,1));  A2 = eval(M_num(2,2));  A3 = eval(M_num(3,3));
B1 = eval(B1);          B2 = eval(B2);          B3 = eval(B3);
C1 = 0;                 C2 = 0;                 C3 = 0;

% Funciones de trasferencia de los tres eslabones
Gs1 = tf([Kt(1,1)*R1],[A1 B1 C1]);
Gs2 = tf([Kt(2,2)*R2],[A2 B2 C2]);
Gs3 = tf([Kt(3,3)*R3],[A3 B3 C3]);
end   

% --- Executes on button press in control2.
function control2_Callback(hObject, eventdata, handles)
% hObject    handle to control2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in control3.
function control3_Callback(hObject, eventdata, handles)
% hObject    handle to control3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in generar.
function generar_Callback(hObject, eventdata, handles)
% hObject    handle to generar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in editar.
function editar_Callback(hObject, eventdata, handles)
% hObject    handle to editar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% --- Executes when selected object is changed in uibuttongroup4.
function uibuttongroup4_SelectionChangedFcn(hObject, eventdata, handles)
control = get(get(handles.uibuttongroup4,'SelectedObject'),'Tag')
handles.control = control;
guidata(hObject, handles);

% --- Executes when selected object is changed in uibuttongroup3.
function uibuttongroup3_SelectionChangedFcn(hObject, eventdata, handles)
modelo = get(get(handles.uibuttongroup3,'SelectedObject'),'Tag')
switch modelo
    case 'realista'
        load('modeloReal.mat')
        handles.R=R;
        handles.Kt=Kt;
        handles.M_num=M_num;
        handles.V_num=V_num;
        handles.G_num=G_num;
    case 'ideal'
        load('modeloIdeal.mat')
        handles.R=R;
        handles.Kt=Kt;
        handles.M_num=M_num;
        handles.V_num=V_num;
        handles.G_num=G_num;
end
handles.modelo = modelo;
guidata(hObject, handles);


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
R = handles.R;
reductora = get(get(handles.uibuttongroup2,'SelectedObject'),'Tag')
switch reductora
    case 'con'
        R1 = R(1,1)
        R2 = R(2,2)
        R3 = R(3,3)
    case 'sin'
        R1 = 1
        R2 = 1
        R3 = 1
end
handles.R1 = R1;
handles.R2 = R2;
handles.R3 = R3;
handles.reductora = reductora;
guidata(hObject,handles);
