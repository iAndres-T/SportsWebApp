ñ
çC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Utilidades\Automapper\AutoMapperProfile.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 

Utilidades (
.( )

Automapper) 3
{ 
public 

class 
AutoMapperProfile "
:# $
Profile% ,
{ 
public		 
AutoMapperProfile		  
(		  !
)		! "
{

 	
	CreateMap 
< 
Rol 
, 
VMRol  
>  !
(! "
)" #
.# $

ReverseMap$ .
(. /
)/ 0
;0 1
	CreateMap 
< 
Usuario 
, 
	VMUsuario (
>( )
() *
)* +
. 
	ForMember 
( 
destino "
=># %
destino 
. 
Estado 
, 
opt 
=> 
opt 
. 
MapFrom "
(" #
origen# )
=>* ,
origen- 3
.3 4
Estado4 :
==; =
true> B
?C D
$numE F
:G H
$numI J
)J K
) 
. 
	ForMember 
( 
destino "
=># %
destino 
. 
	NombreRol !
,! "
opt 
=> 
opt 
. 
MapFrom "
(" #
origen# )
=>* ,
origen- 3
.3 4
IdRolNavigation4 C
.C D
NombreD J
)J K
) 
; 
	CreateMap 
< 
	VMUsuario 
,  
Usuario! (
>( )
() *
)* +
. 
	ForMember 
( 
destino "
=># %
destino 
. 
Estado 
, 
opt 
=> 
opt 
. 
MapFrom "
(" #
origen# )
=>* ,
origen- 3
.3 4
Estado4 :
==; =
$num> ?
?@ A
trueB F
:G H
falseI N
)N O
) 
. 
	ForMember 
( 
destino "
=># %
destino   
.   
IdRolNavigation   '
,  ' (
opt!! 
=>!! 
opt!! 
.!! 
Ignore!! !
(!!! "
)!!" #
)"" 
;"" 
	CreateMap&& 
<&& 
Estadistica&& !
,&&! "
VMEstadistica&&# 0
>&&0 1
(&&1 2
)&&2 3
.&&3 4

ReverseMap&&4 >
(&&> ?
)&&? @
;&&@ A
	CreateMap++ 
<++ 
Elemento_Inventario++ )
,++) *!
VMElemento_Inventario+++ @
>++@ A
(++A B
)++B C
.++C D

ReverseMap++D N
(++N O
)++O P
;++P Q
	CreateMap// 
<// 
Evento// 
,// 
VMEvento// &
>//& '
(//' (
)//( )
.//) *

ReverseMap//* 4
(//4 5
)//5 6
;//6 7
	CreateMap33 
<33 
Menu33 
,33 
VMMenu33 "
>33" #
(33# $
)33$ %
.33% &

ReverseMap33& 0
(330 1
)331 2
;332 3
}55 	
}66 
}77 Á
ëC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Utilidades\ViewComponents\MenuViewComponent.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 

Utilidades (
.( )
ViewComponents) 7
{ 
public		 

class		 
MenuViewComponent		 "
:		# $
ViewComponent		% 2
{

 
private 
readonly 
IMenuService %
_menuService& 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
public 
MenuViewComponent  
(  !
IMenuService! -
menuService. 9
,9 :
IMapper; B
mapperC I
)I J
{ 	
_menuService 
= 
menuService &
;& '
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
<  
IViewComponentResult .
>. /
InvokeAsync0 ;
(; <
)< =
{ 	
ClaimsPrincipal 
	claimUser %
=& '
HttpContext( 3
.3 4
User4 8
;8 9
List 
< 
VMMenu 
> 

listaMenus #
;# $
if 
( 
	claimUser 
. 
Identity "
." #
IsAuthenticated# 2
)2 3
{ 
string 
	idUsuario  
=! "
	claimUser# ,
., -
Claims- 3
. 
Where 
( 
c 
=> 
c 
. 
Type "
==# %

ClaimTypes& 0
.0 1
NameIdentifier1 ?
)? @
. 
Select 
( 
c 
=> 
c 
. 
Value $
)$ %
.% &
SingleOrDefault& 5
(5 6
)6 7
;7 8

listaMenus 
= 
_mapper $
.$ %
Map% (
<( )
List) -
<- .
VMMenu. 4
>4 5
>5 6
(6 7
await7 <
_menuService= I
.I J
ObtenerMenuJ U
(U V
intV Y
.Y Z
ParseZ _
(_ `
	idUsuario` i
)i j
)j k
)k l
;l m
}   
else!! 
{"" 

listaMenus## 
=## 
new##  
List##! %
<##% &
VMMenu##& ,
>##, -
{##. /
}##0 1
;##1 2
}$$ 
return&& 
View&& 
(&& 

listaMenus&& "
)&&" #
;&&# $
}(( 	
}** 
}++ ‚
òC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Utilidades\ViewComponents\MenuUsuarioViewComponent.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 

Utilidades (
.( )
ViewComponents) 7
{ 
public 

class $
MenuUsuarioViewComponent )
:* +
ViewComponent, 9
{ 
public 
async 
Task 
<  
IViewComponentResult .
>. /
InvokeAsync0 ;
(; <
)< =
{		 	
ClaimsPrincipal

 
	claimUser

 %
=

& '
HttpContext

( 3
.

3 4
User

4 8
;

8 9
string 
? 
nombreUsuario !
=" #
$str$ &
;& '
if 
( 
	claimUser 
. 
Identity "
." #
IsAuthenticated# 2
)2 3
{ 
nombreUsuario 
= 
	claimUser  )
.) *
Claims* 0
. 
Where 
( 
c 
=> 
c  !
.! "
Type" &
==' )

ClaimTypes* 4
.4 5
Name5 9
)9 :
. 
Select 
( 
c 
=>  
c! "
." #
Value# (
)( )
.) *
SingleOrDefault* 9
(9 :
): ;
;; <
} 
ViewData 
[ 
$str $
]$ %
=& '
nombreUsuario( 5
;5 6
return 
View 
( 
) 
; 
} 	
} 
} §	
âC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Utilidades\Response\GenericResponse.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 

Utilidades (
.( )
Response) 1
{ 
public 

class 
GenericResponse  
<  !
TObject! (
>( )
{ 
public 
bool 
Estado 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
? 
Mensaje 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
TObject 
? 
Objeto 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
TObject 
> 
? 
ListaObjeto )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
}		 
}

 ™
ñC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Utilidades\Extensiones\CustomAssemblyLoadContext.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 

Utilidades (
.( )
Extensiones) 4
{ 
public 

class %
CustomAssemblyLoadContext *
:+ ,
AssemblyLoadContext- @
{ 
public 
IntPtr  
LoadUnmanagedLibrary *
(* +
string+ 1
absolutePath2 >
)> ?
{		 	
return

 
LoadUnmanagedDll

 #
(

# $
absolutePath

$ 0
)

0 1
;

1 2
} 	
	protected 
override 
IntPtr !
LoadUnmanagedDll" 2
(2 3
string3 9
unmanagedDllName: J
)J K
{ 	
return $
LoadUnmanagedDllFromPath +
(+ ,
unmanagedDllName, <
)< =
;= >
} 	
	protected 
override 
Assembly #
Load$ (
(( )
AssemblyName) 5
assemblyName6 B
)B C
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} √
mC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. #
AddControllersWithViews (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddAuthentication "
(" #(
CookieAuthenticationDefaults# ?
.? @ 
AuthenticationScheme@ T
)T U
. 
	AddCookie 
( 
option 
=> 
{ 
option 
. 
	LoginPath 
= 
$str *
;* +
option 
. 
ExpireTimeSpan 
= 
TimeSpan  (
.( )
FromMinutes) 4
(4 5
$num5 7
)7 8
;8 9
} 
) 
; 
builder 
. 
Services 
. 
InyectarDependencia $
($ %
builder% ,
., -
Configuration- :
): ;
;; <
builder 
. 
Services 
. 
AddAutoMapper 
( 
typeof %
(% &
AutoMapperProfile& 7
)7 8
)8 9
;9 :
var 
context 
= 
new %
CustomAssemblyLoadContext +
(+ ,
), -
;- .
context 
.  
LoadUnmanagedLibrary 
( 
Path !
.! "
Combine" )
() *
	Directory* 3
.3 4
GetCurrentDirectory4 G
(G H
)H I
,I J
$strK p
)p q
)q r
;r s
builder 
. 
Services 
. 
AddSingleton 
( 
typeof $
($ %

IConverter% /
)/ 0
,0 1
new2 5!
SynchronizedConverter6 K
(K L
newL O
PdfToolsP X
(X Y
)Y Z
)Z [
)[ \
;\ ]
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
! 
app 
. 	
Environment	 
. 
IsDevelopment "
(" #
)# $
)$ %
{   
app!! 
.!! 
UseExceptionHandler!! 
(!! 
$str!! )
)!!) *
;!!* +
}"" 
app## 
.## 
UseStaticFiles## 
(## 
)## 
;## 
app%% 
.%% 

UseRouting%% 
(%% 
)%% 
;%% 
app'' 
.'' 
UseAuthentication'' 
('' 
)'' 
;'' 
app)) 
.)) 
UseAuthorization)) 
()) 
))) 
;)) 
app++ 
.++ 
MapControllerRoute++ 
(++ 
name,, 
:,, 	
$str,,
 
,,, 
pattern-- 
:-- 
$str-- 7
)--7 8
;--8 9
app// 
.// 
Run// 
(// 
)// 	
;//	 
ê
ÖC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ViewModel\VMUsuarioLogin.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
.$ %
	ViewModel% .
{ 
public 

class 
VMUsuarioLogin 
{ 
public 
int 
	Documento 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Clave 
{ 
get !
;! "
set# &
;& '
}( )
=* +
null, 0
!0 1
;1 2
} 
} Ë
ÄC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ViewModel\VMUsuario.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
.$ %
	ViewModel% .
{ 
public 

class 
	VMUsuario 
{ 
public 
int 
	Documento 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
public 
int 
Estado 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Clave 
{ 
get !
;! "
set# &
;& '
}( )
=* +
null, 0
!0 1
;1 2
public		 
int		 
IdRol		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
public

 
string

 
	NombreRol

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
=

. /
null

0 4
!

4 5
;

5 6
} 
} «
|C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ViewModel\VMRol.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
.$ %
	ViewModel% .
{ 
public 

class 
VMRol 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
? 
Nombre 
{ 
get  #
;# $
set% (
;( )
}* +
} 
}		 ‹
ÉC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ViewModel\VMPDFJugador.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
.$ %
	ViewModel% .
{ 
public 

class 
VMPDFJugador 
{ 
public 
	VMUsuario 
usuario  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
null1 5
!5 6
;6 7
public 
VMEstadistica 
estadistica (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
null9 =
!= >
;> ?
} 
} é
}C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ViewModel\VMMenu.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
.$ %
	ViewModel% .
{ 
public 

class 
VMMenu 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
public 
string 
Icono 
{ 
get !
;! "
set# &
;& '
}( )
=* +
null, 0
!0 1
;1 2
public 
string 
Controlador !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public		 
string		 
PaginaAccion		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
=		1 2
null		3 7
!		7 8
;		8 9
}

 
} ∑
C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ViewModel\VMEvento.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
.$ %
	ViewModel% .
{ 
public 

class 
VMEvento 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public 
DateTime 
Fecha 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
	IdUsuario 
{ 
get "
;" #
set$ '
;' (
}) *
}		 
}

 À
ÑC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ViewModel\VMEstadistica.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
.$ %
	ViewModel% .
{ 
public 

class 
VMEstadistica 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
PartidosJugados "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
Goles 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
Asistencias 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
int		 
	Amarillas		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
int

 
Rojas

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 
int 
	IdUsuario 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ß

åC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ViewModel\VMElemento_Inventario.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
.$ %
	ViewModel% .
{ 
public 

class !
VMElemento_Inventario &
{ 
public 
int 
Codigo 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
public 
string 
Marca 
{ 
get !
;! "
set# &
;& '
}( )
=* +
null, 0
!0 1
;1 2
public 
int 
Cantidad 
{ 
get !
;! "
set# &
;& '
}( )
public		 
int		 
	IdUsuario		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} —<
ÉC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Controllers\UsuarioController.cs
	namespace		 	
SistemaDeportes		
 
.		 
Web		 
.		 
Controllers		 )
{

 
public 

class 
UsuarioController "
:# $

Controller% /
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IUsuarioService (
_usuarioService) 8
;8 9
private 
readonly 
IRolService $
_rolService% 0
;0 1
public 
UsuarioController  
(  !
IMapper! (
mapper) /
,/ 0
IUsuarioService1 @
usuarioServiceA O
,O P
IRolServiceQ \

rolService] g
)g h
{ 	
_mapper 
= 
mapper 
; 
_usuarioService 
= 
usuarioService ,
;, -
_rolService 
= 

rolService $
;$ %
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (

ListaRoles) 3
(3 4
)4 5
{ 	
List   
<   
VMRol   
>   
vmListaRoles   $
=  % &
_mapper  ' .
.  . /
Map  / 2
<  2 3
List  3 7
<  7 8
VMRol  8 =
>  = >
>  > ?
(  ? @
await  @ E
_rolService  F Q
.  Q R
Lista  R W
(  W X
)  X Y
)  Y Z
;  Z [
return!! 

StatusCode!! 
(!! 
StatusCodes!! )
.!!) *
Status200OK!!* 5
,!!5 6
vmListaRoles!!7 C
)!!C D
;!!D E
}"" 	
[$$ 	
HttpGet$$	 
]$$ 
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Lista%%) .
(%%. /
)%%/ 0
{&& 	
List'' 
<'' 
	VMUsuario'' 
>'' 
vmListaUser'' '
=''( )
_mapper''* 1
.''1 2
Map''2 5
<''5 6
List''6 :
<'': ;
	VMUsuario''; D
>''D E
>''E F
(''F G
await''G L
_usuarioService''M \
.''\ ]
Lista''] b
(''b c
)''c d
)''d e
;''e f
return(( 

StatusCode(( 
((( 
StatusCodes(( )
.(() *
Status200OK((* 5
,((5 6
new((7 :
{((; <
data((= A
=((B C
vmListaUser((D O
}((P Q
)((Q R
;((R S
})) 	
[++ 	
HttpPost++	 
]++ 
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
Crear,,) .
(,,. /
[,,/ 0
FromForm,,0 8
],,8 9
string,,: @
modelo,,A G
),,G H
{-- 	
GenericResponse.. 
<.. 
	VMUsuario.. %
>..% &
	gResponse..' 0
=..1 2
new..3 6
GenericResponse..7 F
<..F G
	VMUsuario..G P
>..P Q
(..Q R
)..R S
;..S T
try00 
{11 
	VMUsuario22 
	vmUsuario22 #
=22$ %
JsonConvert22& 1
.221 2
DeserializeObject222 C
<22C D
	VMUsuario22D M
>22M N
(22N O
modelo22O U
)22U V
;22V W
Usuario44 
usuario_creado44 &
=44' (
await44) .
_usuarioService44/ >
.44> ?
Crear44? D
(44D E
_mapper44E L
.44L M
Map44M P
<44P Q
Usuario44Q X
>44X Y
(44Y Z
	vmUsuario44Z c
)44c d
)44d e
;44e f
	vmUsuario66 
=66 
_mapper66 #
.66# $
Map66$ '
<66' (
	VMUsuario66( 1
>661 2
(662 3
usuario_creado663 A
)66A B
;66B C
	gResponse88 
.88 
Estado88  
=88! "
true88# '
;88' (
	gResponse99 
.99 
Objeto99  
=99! "
	vmUsuario99# ,
;99, -
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
	gResponse== 
.== 
Estado==  
===! "
false==# (
;==( )
	gResponse>> 
.>> 
Mensaje>> !
=>>" #
ex>>$ &
.>>& '
Message>>' .
;>>. /
}?? 
returnAA 

StatusCodeAA 
(AA 
StatusCodesAA )
.AA) *
Status200OKAA* 5
,AA5 6
	gResponseAA7 @
)AA@ A
;AAA B
}BB 	
[DD 	
HttpPutDD	 
]DD 
publicEE 
asyncEE 
TaskEE 
<EE 
IActionResultEE '
>EE' (

DesactivarEE) 3
(EE3 4
[EE4 5
FromFormEE5 =
]EE= >
stringEE? E
modeloEEF L
)EEL M
{FF 	
GenericResponseGG 
<GG 
	VMUsuarioGG %
>GG% &
	gResponseGG' 0
=GG1 2
newGG3 6
GenericResponseGG7 F
<GGF G
	VMUsuarioGGG P
>GGP Q
(GGQ R
)GGR S
;GGS T
tryII 
{JJ 
	VMUsuarioKK 
	vmUsuarioKK #
=KK$ %
JsonConvertKK& 1
.KK1 2
DeserializeObjectKK2 C
<KKC D
	VMUsuarioKKD M
>KKM N
(KKN O
modeloKKO U
)KKU V
;KKV W
UsuarioMM 
usuario_editadoMM '
=MM( )
awaitMM* /
_usuarioServiceMM0 ?
.MM? @

DesactivarMM@ J
(MMJ K
_mapperMMK R
.MMR S
MapMMS V
<MMV W
UsuarioMMW ^
>MM^ _
(MM_ `
	vmUsuarioMM` i
)MMi j
)MMj k
;MMk l
	vmUsuarioOO 
=OO 
_mapperOO #
.OO# $
MapOO$ '
<OO' (
	VMUsuarioOO( 1
>OO1 2
(OO2 3
usuario_editadoOO3 B
)OOB C
;OOC D
	gResponseQQ 
.QQ 
EstadoQQ  
=QQ! "
trueQQ# '
;QQ' (
	gResponseRR 
.RR 
ObjetoRR  
=RR! "
	vmUsuarioRR# ,
;RR, -
}SS 
catchTT 
(TT 
	ExceptionTT 
exTT 
)TT  
{UU 
	gResponseVV 
.VV 
EstadoVV  
=VV! "
falseVV# (
;VV( )
	gResponseWW 
.WW 
MensajeWW !
=WW" #
exWW$ &
.WW& '
MessageWW' .
;WW. /
}XX 
returnZZ 

StatusCodeZZ 
(ZZ 
StatusCodesZZ )
.ZZ) *
Status200OKZZ* 5
,ZZ5 6
	gResponseZZ7 @
)ZZ@ A
;ZZA B
}[[ 	
}\\ 
}]] ˚
{C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Models\ErrorViewModel.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Models $
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
? 
	RequestId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
} 
}		 öS
ÜC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Controllers\InventarioController.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Controllers )
{ 
public 

class  
InventarioController %
:& '

Controller( 2
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IInventarioService +
_inventarioService, >
;> ?
public  
InventarioController #
(# $
IMapper$ +
mapper, 2
,2 3
IInventarioService4 F
inventarioServiceG X
)X Y
{ 	
_mapper 
= 
mapper 
; 
_inventarioService 
=  
inventarioService! 2
;2 3
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Lista) .
(. /
)/ 0
{   	
List!! 
<!! !
VMElemento_Inventario!! &
>!!& '
vmListaElemento!!( 7
=!!8 9
_mapper!!: A
.!!A B
Map!!B E
<!!E F
List!!F J
<!!J K!
VMElemento_Inventario!!K `
>!!` a
>!!a b
(!!b c
await!!c h
_inventarioService!!i {
.!!{ |
Lista	!!| Å
(
!!Å Ç
)
!!Ç É
)
!!É Ñ
;
!!Ñ Ö
return"" 

StatusCode"" 
("" 
StatusCodes"" )
."") *
Status200OK""* 5
,""5 6
new""7 :
{""; <
data""= A
=""B C
vmListaElemento""D S
}""T U
)""U V
;""V W
}## 	
[%% 	
HttpPost%%	 
]%% 
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
Crear&&) .
(&&. /
[&&/ 0
FromForm&&0 8
]&&8 9
string&&: @
modelo&&A G
)&&G H
{'' 	
GenericResponse(( 
<(( !
VMElemento_Inventario(( 1
>((1 2
	gResponse((3 <
=((= >
new((? B
GenericResponse((C R
<((R S!
VMElemento_Inventario((S h
>((h i
(((i j
)((j k
;((k l
try** 
{++ !
VMElemento_Inventario,, %

vmElemento,,& 0
=,,1 2
JsonConvert,,3 >
.,,> ?
DeserializeObject,,? P
<,,P Q!
VMElemento_Inventario,,Q f
>,,f g
(,,g h
modelo,,h n
),,n o
;,,o p
ClaimsPrincipal.. 
	claimUser..  )
=..* +
HttpContext.., 7
...7 8
User..8 <
;..< =
string// 
?// 
	idusuario// !
=//" #
$str//$ &
;//& '
if00 
(00 
	claimUser00 
.00 
Identity00 &
.00& '
IsAuthenticated00' 6
)006 7
{11 
	idusuario22 
=22 
	claimUser22  )
.22) *
Claims22* 0
.33 
Where33 
(33 
c33  
=>33! #
c33$ %
.33% &
Type33& *
==33+ -

ClaimTypes33. 8
.338 9
NameIdentifier339 G
)33G H
.44 
Select44 
(44  
c44  !
=>44" $
c44% &
.44& '
Value44' ,
)44, -
.44- .
SingleOrDefault44. =
(44= >
)44> ?
;44? @
}55 

vmElemento77 
.77 
	IdUsuario77 $
=77% &
int77' *
.77* +
Parse77+ 0
(770 1
	idusuario771 :
)77: ;
;77; <
Elemento_Inventario99 #
elemento_creado99$ 3
=994 5
await996 ;
_inventarioService99< N
.99N O
Crear99O T
(99T U
_mapper99U \
.99\ ]
Map99] `
<99` a
Elemento_Inventario99a t
>99t u
(99u v

vmElemento	99v Ä
)
99Ä Å
)
99Å Ç
;
99Ç É

vmElemento;; 
=;; 
_mapper;; $
.;;$ %
Map;;% (
<;;( )!
VMElemento_Inventario;;) >
>;;> ?
(;;? @
elemento_creado;;@ O
);;O P
;;;P Q
	gResponse== 
.== 
Estado==  
===! "
true==# '
;==' (
	gResponse>> 
.>> 
Objeto>>  
=>>! "

vmElemento>># -
;>>- .
}?? 
catch@@ 
(@@ 
	Exception@@ 
ex@@ 
)@@  
{AA 
	gResponseBB 
.BB 
EstadoBB  
=BB! "
falseBB# (
;BB( )
	gResponseCC 
.CC 
MensajeCC !
=CC" #
exCC$ &
.CC& '
MessageCC' .
;CC. /
}DD 
returnFF 

StatusCodeFF 
(FF 
StatusCodesFF )
.FF) *
Status200OKFF* 5
,FF5 6
	gResponseFF7 @
)FF@ A
;FFA B
}GG 	
[II 	
HttpPutII	 
]II 
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
EditarJJ) /
(JJ/ 0
[JJ0 1
FromFormJJ1 9
]JJ9 :
stringJJ; A
modeloJJB H
)JJH I
{KK 	
GenericResponseLL 
<LL !
VMElemento_InventarioLL 1
>LL1 2
	gResponseLL3 <
=LL= >
newLL? B
GenericResponseLLC R
<LLR S!
VMElemento_InventarioLLS h
>LLh i
(LLi j
)LLj k
;LLk l
tryNN 
{OO !
VMElemento_InventarioPP %

vmElementoPP& 0
=PP1 2
JsonConvertPP3 >
.PP> ?
DeserializeObjectPP? P
<PPP Q!
VMElemento_InventarioPPQ f
>PPf g
(PPg h
modeloPPh n
)PPn o
;PPo p
ClaimsPrincipalRR 
	claimUserRR  )
=RR* +
HttpContextRR, 7
.RR7 8
UserRR8 <
;RR< =
stringSS 
?SS 
	idusuarioSS !
=SS" #
$strSS$ &
;SS& '
ifTT 
(TT 
	claimUserTT 
.TT 
IdentityTT &
.TT& '
IsAuthenticatedTT' 6
)TT6 7
{UU 
	idusuarioVV 
=VV 
	claimUserVV  )
.VV) *
ClaimsVV* 0
.WW 
WhereWW 
(WW 
cWW  
=>WW! #
cWW$ %
.WW% &
TypeWW& *
==WW+ -

ClaimTypesWW. 8
.WW8 9
NameIdentifierWW9 G
)WWG H
.XX 
SelectXX 
(XX  
cXX  !
=>XX" $
cXX% &
.XX& '
ValueXX' ,
)XX, -
.XX- .
SingleOrDefaultXX. =
(XX= >
)XX> ?
;XX? @
}YY 

vmElemento[[ 
.[[ 
	IdUsuario[[ $
=[[% &
int[[' *
.[[* +
Parse[[+ 0
([[0 1
	idusuario[[1 :
)[[: ;
;[[; <
Elemento_Inventario]] #
elemento_editado]]$ 4
=]]5 6
await]]7 <
_inventarioService]]= O
.]]O P
Editar]]P V
(]]V W
_mapper]]W ^
.]]^ _
Map]]_ b
<]]b c
Elemento_Inventario]]c v
>]]v w
(]]w x

vmElemento	]]x Ç
)
]]Ç É
)
]]É Ñ
;
]]Ñ Ö

vmElemento__ 
=__ 
_mapper__ $
.__$ %
Map__% (
<__( )!
VMElemento_Inventario__) >
>__> ?
(__? @
elemento_editado__@ P
)__P Q
;__Q R
	gResponseaa 
.aa 
Estadoaa  
=aa! "
trueaa# '
;aa' (
	gResponsebb 
.bb 
Objetobb  
=bb! "

vmElementobb# -
;bb- .
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
	gResponseff 
.ff 
Estadoff  
=ff! "
falseff# (
;ff( )
	gResponsegg 
.gg 
Mensajegg !
=gg" #
exgg$ &
.gg& '
Messagegg' .
;gg. /
}hh 
returnjj 

StatusCodejj 
(jj 
StatusCodesjj )
.jj) *
Status200OKjj* 5
,jj5 6
	gResponsejj7 @
)jj@ A
;jjA B
}kk 	
[mm 	

HttpDeletemm	 
]mm 
publicnn 
asyncnn 
Tasknn 
<nn 
IActionResultnn '
>nn' (
Eliminarnn) 1
(nn1 2
intnn2 5
codigonn6 <
)nn< =
{oo 	
GenericResponsepp 
<pp 
stringpp "
>pp" #
	gResponsepp$ -
=pp. /
newpp0 3
GenericResponsepp4 C
<ppC D
stringppD J
>ppJ K
(ppK L
)ppL M
;ppM N
tryrr 
{ss 
	gResponsett 
.tt 
Estadott  
=tt! "
awaittt# (
_inventarioServicett) ;
.tt; <
Eliminartt< D
(ttD E
codigottE K
)ttK L
;ttL M
}uu 
catchvv 
(vv 
	Exceptionvv 
exvv 
)vv  
{ww 
	gResponsexx 
.xx 
Estadoxx  
=xx! "
falsexx# (
;xx( )
	gResponseyy 
.yy 
Mensajeyy !
=yy" #
exyy$ &
.yy& '
Messageyy' .
;yy. /
}zz 
return|| 

StatusCode|| 
(|| 
StatusCodes|| )
.||) *
Status200OK||* 5
,||5 6
	gResponse||7 @
)||@ A
;||A B
}}} 	
}~~ 
} Ú
ÄC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Controllers\HomeController.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Controllers )
{		 
[

 
	Authorize

 
]

 
public 

class 
HomeController 
:  !

Controller" ,
{ 
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
Privacy $
($ %
)% &
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
ResponseCache	 
( 
Duration 
=  !
$num" #
,# $
Location% -
=. /!
ResponseCacheLocation0 E
.E F
NoneF J
,J K
NoStoreL S
=T U
trueV Z
)Z [
][ \
public 
IActionResult 
Error "
(" #
)# $
{ 	
return 
View 
( 
new 
ErrorViewModel *
{+ ,
	RequestId- 6
=7 8
Activity9 A
.A B
CurrentB I
?I J
.J K
IdK M
??N P
HttpContextQ \
.\ ]
TraceIdentifier] l
}m n
)n o
;o p
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Salir) .
(. /
)/ 0
{ 	
await 
HttpContext 
. 
SignOutAsync *
(* +(
CookieAuthenticationDefaults+ G
.G H 
AuthenticationSchemeH \
)\ ]
;] ^
return   
RedirectToAction   #
(  # $
$str  $ +
,  + ,
$str  - 5
)  5 6
;  6 7
}!! 	
}"" 
}## Â7
ÇC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Controllers\EventoController.cs
	namespace

 	
SistemaDeportes


 
.

 
Web

 
.

 
Controllers

 )
{ 
public 

class 
EventoController !
:" #

Controller$ .
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IEventoService '
_eventoService( 6
;6 7
public 
EventoController 
(  
IMapper  '
mapper( .
,. /
IEventoService0 >
eventoService? L
)L M
{ 	
_mapper 
= 
mapper 
; 
_eventoService 
= 
eventoService *
;* +
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
EventoJugador *
(* +
)+ ,
{ 	
return 
View 
( 
) 
; 
} 	
[!! 	
HttpGet!!	 
]!! 
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' (
Lista"") .
("". /
)""/ 0
{## 	
List$$ 
<$$ 
VMEvento$$ 
>$$ 
vmListaEvento$$ (
=$$) *
_mapper$$+ 2
.$$2 3
Map$$3 6
<$$6 7
List$$7 ;
<$$; <
VMEvento$$< D
>$$D E
>$$E F
($$F G
await$$G L
_eventoService$$M [
.$$[ \
Lista$$\ a
($$a b
)$$b c
)$$c d
;$$d e
return%% 

StatusCode%% 
(%% 
StatusCodes%% )
.%%) *
Status200OK%%* 5
,%%5 6
new%%7 :
{%%; <
data%%= A
=%%B C
vmListaEvento%%D Q
}%%R S
)%%S T
;%%T U
}&& 	
[(( 	
HttpPost((	 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
Crear))) .
()). /
[))/ 0
FromForm))0 8
]))8 9
string)): @
modelo))A G
)))G H
{** 	
GenericResponse++ 
<++ 
VMEvento++ $
>++$ %
	gResponse++& /
=++0 1
new++2 5
GenericResponse++6 E
<++E F
VMEvento++F N
>++N O
(++O P
)++P Q
;++Q R
try-- 
{.. 
VMEvento// 
vmEvento// !
=//" #
JsonConvert//$ /
./// 0
DeserializeObject//0 A
<//A B
VMEvento//B J
>//J K
(//K L
modelo//L R
)//R S
;//S T
ClaimsPrincipal11 
	claimUser11  )
=11* +
HttpContext11, 7
.117 8
User118 <
;11< =
string22 
?22 
	idusuario22 !
=22" #
$str22$ &
;22& '
if33 
(33 
	claimUser33 
.33 
Identity33 &
.33& '
IsAuthenticated33' 6
)336 7
{44 
	idusuario55 
=55 
	claimUser55  )
.55) *
Claims55* 0
.66 
Where66 
(66 
c66  
=>66! #
c66$ %
.66% &
Type66& *
==66+ -

ClaimTypes66. 8
.668 9
NameIdentifier669 G
)66G H
.77 
Select77 
(77  
c77  !
=>77" $
c77% &
.77& '
Value77' ,
)77, -
.77- .
SingleOrDefault77. =
(77= >
)77> ?
;77? @
}88 
vmEvento:: 
.:: 
	IdUsuario:: "
=::# $
int::% (
.::( )
Parse::) .
(::. /
	idusuario::/ 8
)::8 9
;::9 :
Evento<< 
evento_creado<< $
=<<% &
await<<' ,
_eventoService<<- ;
.<<; <
Crear<<< A
(<<A B
_mapper<<B I
.<<I J
Map<<J M
<<<M N
Evento<<N T
><<T U
(<<U V
vmEvento<<V ^
)<<^ _
)<<_ `
;<<` a
vmEvento>> 
=>> 
_mapper>> "
.>>" #
Map>># &
<>>& '
VMEvento>>' /
>>>/ 0
(>>0 1
evento_creado>>1 >
)>>> ?
;>>? @
	gResponse@@ 
.@@ 
Estado@@  
=@@! "
true@@# '
;@@' (
	gResponseAA 
.AA 
ObjetoAA  
=AA! "
vmEventoAA# +
;AA+ ,
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
	gResponseEE 
.EE 
EstadoEE  
=EE! "
falseEE# (
;EE( )
	gResponseFF 
.FF 
MensajeFF !
=FF" #
exFF$ &
.FF& '
MessageFF' .
;FF. /
}GG 
returnII 

StatusCodeII 
(II 
StatusCodesII )
.II) *
Status200OKII* 5
,II5 6
	gResponseII7 @
)II@ A
;IIA B
}JJ 	
[LL 	

HttpDeleteLL	 
]LL 
publicMM 
asyncMM 
TaskMM 
<MM 
IActionResultMM '
>MM' (
EliminarMM) 1
(MM1 2
intMM2 5
idMM6 8
)MM8 9
{NN 	
GenericResponseOO 
<OO 
stringOO "
>OO" #
	gResponseOO$ -
=OO. /
newOO0 3
GenericResponseOO4 C
<OOC D
stringOOD J
>OOJ K
(OOK L
)OOL M
;OOM N
tryQQ 
{RR 
	gResponseSS 
.SS 
EstadoSS  
=SS! "
awaitSS# (
_eventoServiceSS) 7
.SS7 8
EliminarSS8 @
(SS@ A
idSSA C
)SSC D
;SSD E
}TT 
catchUU 
(UU 
	ExceptionUU 
exUU 
)UU  
{VV 
	gResponseWW 
.WW 
EstadoWW  
=WW! "
falseWW# (
;WW( )
	gResponseXX 
.XX 
MensajeXX !
=XX" #
exXX$ &
.XX& '
MessageXX' .
;XX. /
}YY 
return[[ 

StatusCode[[ 
([[ 
StatusCodes[[ )
.[[) *
Status200OK[[* 5
,[[5 6
	gResponse[[7 @
)[[@ A
;[[A B
}\\ 	
}]] 
}^^ ø
C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Controllers\PDFController.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Controllers )
{ 
public		 

class		 
PDFController		 
:		  

Controller		! +
{

 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IEstadisticaService ,
_estadisticaService- @
;@ A
private 
readonly 
IUsuarioService (
_usuarioService) 8
;8 9
public 
PDFController 
( 
IMapper $
mapper% +
,+ ,
IEstadisticaService- @
estadisticaServiceA S
,S T
IUsuarioServiceU d
usuarioServicee s
)s t
{ 	
_mapper 
= 
mapper 
; 
_estadisticaService 
=  !
estadisticaService" 4
;4 5
_usuarioService 
= 
usuarioService ,
;, -
} 	
public 
async 
Task 
< 
IActionResult '
>' (
PDFEstadistica) 7
(7 8
int8 ;
	documento< E
)E F
{ 	
VMEstadistica 
vmEstadistica '
=( )
_mapper* 1
.1 2
Map2 5
<5 6
VMEstadistica6 C
>C D
(D E
awaitE J
_estadisticaServiceK ^
.^ _
ObtenerJugador_ m
(m n
	documenton w
)w x
)x y
;y z
	VMUsuario 
	vmUsuario 
=  !
_mapper" )
.) *
Map* -
<- .
	VMUsuario. 7
>7 8
(8 9
await9 >
_usuarioService? N
.N O
ObtenerPorIdO [
([ \
	documento\ e
)e f
)f g
;g h
VMPDFJugador 
modelo 
=  !
new" %
VMPDFJugador& 2
(2 3
)3 4
;4 5
modelo 
. 
usuario 
= 
	vmUsuario &
;& '
modelo 
. 
estadistica 
=  
vmEstadistica! .
;. /
return 
View 
( 
modelo 
) 
;  
}   	
}!! 
}"" À`
áC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Controllers\EstadisticaController.cs
	namespace 	
SistemaDeportes
 
. 
Web 
. 
Controllers )
{ 
public 

class !
EstadisticaController &
:' (

Controller) 3
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IEstadisticaService ,
_estadisticaService- @
;@ A
private 
readonly 

IConverter #

_converter$ .
;. /
public !
EstadisticaController $
($ %
IMapper% ,
mapper- 3
,3 4
IEstadisticaService5 H
estadisticaServiceI [
,[ \

IConverter] g
	converterh q
)q r
{ 	
_mapper 
= 
mapper 
; 
_estadisticaService 
=  !
estadisticaService" 4
;4 5

_converter 
= 
	converter "
;" #
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public   
IActionResult   
EstadisticaJugador   /
(  / 0
)  0 1
{!! 	
return"" 
View"" 
("" 
)"" 
;"" 
}## 	
[%% 	
HttpGet%%	 
]%% 
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
Lista&&) .
(&&. /
)&&/ 0
{'' 	
List(( 
<(( 
	VMUsuario(( 
>(( 
vmListaUser(( '
=((( )
_mapper((* 1
.((1 2
Map((2 5
<((5 6
List((6 :
<((: ;
	VMUsuario((; D
>((D E
>((E F
(((F G
await((G L
_estadisticaService((M `
.((` a
Lista((a f
(((f g
)((g h
)((h i
;((i j
return)) 

StatusCode)) 
()) 
StatusCodes)) )
.))) *
Status200OK))* 5
,))5 6
new))7 :
{)); <
data))= A
=))B C
vmListaUser))D O
}))P Q
)))Q R
;))R S
}** 	
[,, 	
HttpGet,,	 
],, 
public-- 
async-- 
Task-- 
<-- 
IActionResult-- '
>--' (
ObtenerJugador--) 7
(--7 8
int--8 ;
	documento--< E
)--E F
{.. 	
GenericResponse// 
<// 
VMEstadistica// )
>//) *
	gResponse//+ 4
=//5 6
new//7 :
GenericResponse//; J
<//J K
VMEstadistica//K X
>//X Y
(//Y Z
)//Z [
;//[ \
try11 
{22 
if33 
(33 
	documento33 
==33 
$num33  !
)33! "
{44 
ClaimsPrincipal55 #
	claimUser55$ -
=55. /
HttpContext550 ;
.55; <
User55< @
;55@ A
string66 
?66 
	idusuario66 %
=66& '
$str66( *
;66* +
if77 
(77 
	claimUser77 !
.77! "
Identity77" *
.77* +
IsAuthenticated77+ :
)77: ;
{88 
	idusuario99 !
=99" #
	claimUser99$ -
.99- .
Claims99. 4
.:: 
Where:: "
(::" #
c::# $
=>::% '
c::( )
.::) *
Type::* .
==::/ 1

ClaimTypes::2 <
.::< =
NameIdentifier::= K
)::K L
.;; 
Select;; #
(;;# $
c;;$ %
=>;;& (
c;;) *
.;;* +
Value;;+ 0
);;0 1
.;;1 2
SingleOrDefault;;2 A
(;;A B
);;B C
;;;C D
}<< 
	documento>> 
=>> 
int>>  #
.>># $
Parse>>$ )
(>>) *
	idusuario>>* 3
)>>3 4
;>>4 5
}?? 
EstadisticaAA 
jugadorAA #
=AA$ %
awaitAA& +
_estadisticaServiceAA, ?
.AA? @
ObtenerJugadorAA@ N
(AAN O
	documentoAAO X
)AAX Y
;AAY Z
ifBB 
(BB 
jugadorBB 
!=BB 
nullBB #
)BB# $
{CC 
	gResponseDD 
.DD 
EstadoDD $
=DD% &
trueDD' +
;DD+ ,
	gResponseEE 
.EE 
ObjetoEE $
=EE% &
_mapperEE' .
.EE. /
MapEE/ 2
<EE2 3
VMEstadisticaEE3 @
>EE@ A
(EEA B
jugadorEEB I
)EEI J
;EEJ K
}FF 
}GG 
catchHH 
(HH 
	ExceptionHH 
exHH 
)HH  
{II 
	gResponseJJ 
.JJ 
EstadoJJ  
=JJ! "
falseJJ# (
;JJ( )
	gResponseKK 
.KK 
MensajeKK !
=KK" #
exKK$ &
.KK& '
MessageKK' .
;KK. /
}LL 
returnNN 

StatusCodeNN 
(NN 
StatusCodesNN )
.NN) *
Status200OKNN* 5
,NN5 6
	gResponseNN7 @
)NN@ A
;NNA B
}OO 	
[QQ 	
HttpPostQQ	 
]QQ 
publicRR 
asyncRR 
TaskRR 
<RR 
IActionResultRR '
>RR' (
CrearRR) .
(RR. /
[RR/ 0
FromFormRR0 8
]RR8 9
stringRR: @
modeloRRA G
)RRG H
{SS 	
GenericResponseTT 
<TT 
VMEstadisticaTT )
>TT) *
	gResponseTT+ 4
=TT5 6
newTT7 :
GenericResponseTT; J
<TTJ K
VMEstadisticaTTK X
>TTX Y
(TTY Z
)TTZ [
;TT[ \
tryVV 
{WW 
VMEstadisticaXX 
vmEstadisticaXX +
=XX, -
JsonConvertXX. 9
.XX9 :
DeserializeObjectXX: K
<XXK L
VMEstadisticaXXL Y
>XXY Z
(XXZ [
modeloXX[ a
)XXa b
;XXb c
EstadisticaZZ 
estadistica_creadoZZ .
=ZZ/ 0
awaitZZ1 6
_estadisticaServiceZZ7 J
.ZZJ K
CrearZZK P
(ZZP Q
_mapperZZQ X
.ZZX Y
MapZZY \
<ZZ\ ]
EstadisticaZZ] h
>ZZh i
(ZZi j
vmEstadisticaZZj w
)ZZw x
)ZZx y
;ZZy z
vmEstadistica\\ 
=\\ 
_mapper\\  '
.\\' (
Map\\( +
<\\+ ,
VMEstadistica\\, 9
>\\9 :
(\\: ;
estadistica_creado\\; M
)\\M N
;\\N O
	gResponse^^ 
.^^ 
Estado^^  
=^^! "
true^^# '
;^^' (
	gResponse__ 
.__ 
Objeto__  
=__! "
vmEstadistica__# 0
;__0 1
}`` 
catchaa 
(aa 
	Exceptionaa 
exaa 
)aa  
{bb 
	gResponsecc 
.cc 
Estadocc  
=cc! "
falsecc# (
;cc( )
	gResponsedd 
.dd 
Mensajedd !
=dd" #
exdd$ &
.dd& '
Messagedd' .
;dd. /
}ee 
returngg 

StatusCodegg 
(gg 
StatusCodesgg )
.gg) *
Status200OKgg* 5
,gg5 6
	gResponsegg7 @
)gg@ A
;ggA B
}hh 	
[jj 	
HttpPutjj	 
]jj 
publickk 
asynckk 
Taskkk 
<kk 
IActionResultkk '
>kk' (
Editarkk) /
(kk/ 0
[kk0 1
FromFormkk1 9
]kk9 :
stringkk; A
modelokkB H
)kkH I
{ll 	
GenericResponsemm 
<mm 
VMEstadisticamm )
>mm) *
	gResponsemm+ 4
=mm5 6
newmm7 :
GenericResponsemm; J
<mmJ K
VMEstadisticammK X
>mmX Y
(mmY Z
)mmZ [
;mm[ \
tryoo 
{pp 
VMEstadisticaqq 
vmEstadisticaqq +
=qq, -
JsonConvertqq. 9
.qq9 :
DeserializeObjectqq: K
<qqK L
VMEstadisticaqqL Y
>qqY Z
(qqZ [
modeloqq[ a
)qqa b
;qqb c
Estadisticass 
estadistica_editadoss /
=ss0 1
awaitss2 7
_estadisticaServicess8 K
.ssK L
EditarssL R
(ssR S
_mapperssS Z
.ssZ [
Mapss[ ^
<ss^ _
Estadisticass_ j
>ssj k
(ssk l
vmEstadisticassl y
)ssy z
)ssz {
;ss{ |
vmEstadisticauu 
=uu 
_mapperuu  '
.uu' (
Mapuu( +
<uu+ ,
VMEstadisticauu, 9
>uu9 :
(uu: ;
estadistica_editadouu; N
)uuN O
;uuO P
	gResponseww 
.ww 
Estadoww  
=ww! "
trueww# '
;ww' (
	gResponsexx 
.xx 
Objetoxx  
=xx! "
vmEstadisticaxx# 0
;xx0 1
}yy 
catchzz 
(zz 
	Exceptionzz 
exzz 
)zz  
{{{ 
	gResponse|| 
.|| 
Estado||  
=||! "
false||# (
;||( )
	gResponse}} 
.}} 
Mensaje}} !
=}}" #
ex}}$ &
.}}& '
Message}}' .
;}}. /
}~~ 
return
ÄÄ 

StatusCode
ÄÄ 
(
ÄÄ 
StatusCodes
ÄÄ )
.
ÄÄ) *
Status200OK
ÄÄ* 5
,
ÄÄ5 6
	gResponse
ÄÄ7 @
)
ÄÄ@ A
;
ÄÄA B
}
ÅÅ 	
public
ÉÉ 
IActionResult
ÉÉ 
MostrarPDFJugador
ÉÉ .
(
ÉÉ. /
int
ÉÉ/ 2
	documento
ÉÉ3 <
)
ÉÉ< =
{
ÑÑ 	
string
ÖÖ 
urlPlantillaVista
ÖÖ $
=
ÖÖ% &
$"
ÖÖ' )
{
ÖÖ) *
this
ÖÖ* .
.
ÖÖ. /
Request
ÖÖ/ 6
.
ÖÖ6 7
Scheme
ÖÖ7 =
}
ÖÖ= >
$str
ÖÖ> A
{
ÖÖA B
this
ÖÖB F
.
ÖÖF G
Request
ÖÖG N
.
ÖÖN O
Host
ÖÖO S
}
ÖÖS T
$str
ÖÖT r
{
ÖÖr s
	documento
ÖÖs |
}
ÖÖ| }
"
ÖÖ} ~
;
ÖÖ~ 
var
áá 
pdf
áá 
=
áá 
new
áá 
HtmlToPdfDocument
áá +
(
áá+ ,
)
áá, -
{
àà 
GlobalSettings
ââ 
=
ââ  
new
ââ! $
GlobalSettings
ââ% 3
(
ââ3 4
)
ââ4 5
{
ää 
	PaperSize
ãã 
=
ãã 
	PaperKind
ãã  )
.
ãã) *
A4
ãã* ,
,
ãã, -
Orientation
åå 
=
åå  !
Orientation
åå" -
.
åå- .
Portrait
åå. 6
,
åå6 7
}
çç 
,
çç 
Objects
éé 
=
éé 
{
èè 
new
êê 
ObjectSettings
êê &
(
êê& '
)
êê' (
{
ëë 
Page
íí 
=
íí 
urlPlantillaVista
íí 0
}
ìì 
}
îî 
}
ïï 
;
ïï 
var
óó 

archivoPDF
óó 
=
óó 

_converter
óó '
.
óó' (
Convert
óó( /
(
óó/ 0
pdf
óó0 3
)
óó3 4
;
óó4 5
return
ôô 
File
ôô 
(
ôô 

archivoPDF
ôô "
,
ôô" #
$str
ôô$ 5
)
ôô5 6
;
ôô6 7
}
öö 	
}
õõ 
}úú Ò$
ÇC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.Web\Controllers\AccesoController.cs
	namespace		 	
SistemaDeportes		
 
.		 
Web		 
.		 
Controllers		 )
{

 
public 

class 
AccesoController !
:" #

Controller$ .
{ 
private 
readonly 
IUsuarioService (
_usuarioService) 8
;8 9
public 
AccesoController 
(  
IUsuarioService  /
usuarioService0 >
)> ?
{ 	
_usuarioService 
= 
usuarioService ,
;, -
} 	
public 
IActionResult 
Login "
(" #
)# $
{ 	
ClaimsPrincipal 
	claimUser %
=& '
HttpContext( 3
.3 4
User4 8
;8 9
if 
( 
	claimUser 
. 
Identity "
." #
IsAuthenticated# 2
)2 3
{ 
return 
RedirectToAction '
(' (
$str( /
,/ 0
$str1 7
)7 8
;8 9
} 
return 
View 
( 
) 
; 
} 	
[   	
HttpPost  	 
]   
public!! 
async!! 
Task!! 
<!! 
IActionResult!! '
>!!' (
Login!!) .
(!!. /
VMUsuarioLogin!!/ =
modelo!!> D
)!!D E
{"" 	
Usuario## 

encontrado## 
=##  
await##! &
_usuarioService##' 6
.##6 7"
ObtenerPorCredenciales##7 M
(##M N
modelo##N T
.##T U
	Documento##U ^
,##^ _
modelo##` f
.##f g
Clave##g l
)##l m
;##m n
if%% 
(%% 

encontrado%% 
==%% 
null%% "
)%%" #
{&& 
ViewData'' 
['' 
$str'' "
]''" #
=''$ %
$str''& G
;''G H
return(( 
View(( 
((( 
)(( 
;(( 
})) 
ViewData++ 
[++ 
$str++ 
]++ 
=++  !
null++" &
;++& '
List-- 
<-- 
Claim-- 
>-- 
claims-- 
=--  
new--! $
List--% )
<--) *
Claim--* /
>--/ 0
(--0 1
)--1 2
{.. 
new// 
Claim// 
(// 

ClaimTypes// $
.//$ %
Name//% )
,//) *

encontrado//+ 5
.//5 6
Nombre//6 <
)//< =
,//= >
new00 
Claim00 
(00 

ClaimTypes00 $
.00$ %
NameIdentifier00% 3
,003 4

encontrado005 ?
.00? @
	Documento00@ I
.00I J
ToString00J R
(00R S
)00S T
)00T U
,00U V
new11 
Claim11 
(11 

ClaimTypes11 $
.11$ %
Role11% )
,11) *

encontrado11+ 5
.115 6
IdRol116 ;
.11; <
ToString11< D
(11D E
)11E F
)11F G
}33 
;33 
ClaimsIdentity55 
claimsIdentity55 )
=55* +
new55, /
ClaimsIdentity550 >
(55> ?
claims55? E
,55E F(
CookieAuthenticationDefaults55G c
.55c d 
AuthenticationScheme55d x
)55x y
;55y z$
AuthenticationProperties77 $

properties77% /
=770 1
new772 5$
AuthenticationProperties776 N
(77N O
)77O P
{88 
AllowRefresh99 
=99 
true99 #
,99# $
IsPersistent:: 
=:: 
false:: $
};; 
;;; 
await== 
HttpContext== 
.== 
SignInAsync== )
(==) *(
CookieAuthenticationDefaults>> ,
.>>, - 
AuthenticationScheme>>- A
,>>A B
new?? 
ClaimsPrincipal?? #
(??# $
claimsIdentity??$ 2
)??2 3
,??3 4

properties@@ 
)AA 
;AA 
returnCC 
RedirectToActionCC #
(CC# $
$strCC$ +
,CC+ ,
$strCC- 3
)CC3 4
;CC4 5
}EE 	
}FF 
}GG 