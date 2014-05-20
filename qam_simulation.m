function varargout = qam_simulation(varargin)
% QAM_SIMULATION MATLAB code for qam_simulation.fig
%      QAM_SIMULATION, by itself, creates a new QAM_SIMULATION or raises the existing
%      singleton*.
%
%      H = QAM_SIMULATION returns the handle to a new QAM_SIMULATION or the handle to
%      the existing singleton*.
%
%      QAM_SIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QAM_SIMULATION.M with the given input arguments.
%
%      QAM_SIMULATION('Property','Value',...) creates a new QAM_SIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before qam_simulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to qam_simulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help qam_simulation

% Last Modified by GUIDE v2.5 20-May-2014 11:06:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @qam_simulation_OpeningFcn, ...
                   'gui_OutputFcn',  @qam_simulation_OutputFcn, ...
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

% --- Executes just before qam_simulation is made visible.
function qam_simulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to qam_simulation (see VARARGIN)

% Choose default command line output for qam_simulation
handles.output = hObject;

%%%background image
axes(handles.bits);
handles.slider1 = 1;
set(handles.wartosc_suwaka,'String',1);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes qam_simulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = qam_simulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in wprowadz_tekst.
function wprowadz_tekst_Callback(hObject, eventdata, handles)
% hObject    handle to wprowadz_tekst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.bits);
bit_array = string_input;
set(handles.wyslany_tekst,'String',char(bin2dec(reshape(char('0' + bit_array),8,[]).'))');

stem(bit_array,'filled');
set(gca,'XTick', [0:1:length(bit_array)], 'YTick', [0:1], 'XLim', [1 length(bit_array)], 'YLim', [0 1]);    
set(gca,'XGrid', 'on');
title(handles.bits,'Wygenerowane bity (pierwsze 20)');
xlabel(handles.bits,'Numer bitu');
ylabel(handles.bits,'Wartoœæ bitu');

if (length(bit_array)>20)
axis([0 20 0 1]);
else axis([0 length(bit_array) 0 1]); 
end




% --- Executes on button press in random_bits.
function random_bits_Callback(hObject, eventdata, handles)
% hObject    handle to random_bits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.bits);

bit = bit_generate;

set(handles.wyslany_tekst,'String',' ');
stem(bit,'filled');
set(gca,'XTick', [0:1:length(bit)], 'YTick', [0:1], 'XLim', [1 length(bit)], 'YLim', [0 1]);    
set(gca,'XGrid', 'on');
title(handles.bits,'Wygenerowane bity (pierwsze 20)');
xlabel(handles.bits,'Numer bitu');
ylabel(handles.bits,'Wartoœæ bitu');
axis([0 20 0 1]);

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function bits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(gca,'XTick', [0:1:20], 'YTick', [0:1], 'XLim', [1 20], 'YLim', [0 1]);
axis([0 20 0 1]);

% Hint: place code in OpeningFcn to populate bits



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.suwak = get(hObject,'Value'); 
set(handles.wartosc_suwaka,'String',get(hObject,'Value'));

guidata(hObject, handles); 


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in symuluj.
function symuluj_Callback(hObject, eventdata, handles)
% hObject    handle to symuluj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test();


% --- Executes during object creation, after setting all properties.
function wyslany_tekst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wyslany_tekst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
