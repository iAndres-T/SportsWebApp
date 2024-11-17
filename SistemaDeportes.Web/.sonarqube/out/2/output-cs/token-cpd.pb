‚
ÉC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Interfaces\IUtilidadesService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 

Interfaces (
{ 
public		 

	interface		 
IUtilidadesService		 '
{

 
string 
GenerarClave 
( 
) 
; 
string 
ConvertirSha256 
( 
string %
texto& +
)+ ,
;, -
} 
} §
|C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Interfaces\IRolService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 

Interfaces (
{		 
public

 

	interface

 
IRolService

  
{ 
Task 
< 
List 
< 
Rol 
> 
> 
Lista 
( 
) 
;  
} 
} ¸
ÉC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Interfaces\IInventarioService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 

Interfaces (
{		 
public

 

	interface

 
IInventarioService

 '
{ 
Task 
< 
List 
< 
Elemento_Inventario %
>% &
>& '
Lista( -
(- .
). /
;/ 0
Task 
< 
Elemento_Inventario  
>  !
Crear" '
(' (
Elemento_Inventario( ;
entidad< C
)C D
;D E
Task 
< 
Elemento_Inventario  
>  !
Editar" (
(( )
Elemento_Inventario) <
entidad= D
)D E
;E F
Task 
< 
bool 
> 
Eliminar 
( 
int 
codigo  &
)& '
;' (
} 
} Ä
C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Interfaces\IEventoService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 

Interfaces (
{		 
public

 

	interface

 
IEventoService

 #
{ 
Task 
< 
List 
< 
Evento 
> 
> 
Lista  
(  !
)! "
;" #
Task 
< 
Evento 
> 
Crear 
( 
Evento !
entidad" )
)) *
;* +
Task 
< 
bool 
> 
Eliminar 
( 
int 
id  "
)" #
;# $
} 
} £
C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Implementacion\RolService.cs
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
BLL

 
.

 
Implementacion

 ,
{ 
public 

class 

RolService 
: 
IRolService )
{ 
private 
readonly 
IGenericRepository +
<+ ,
Rol, /
>/ 0
_repository1 <
;< =
public 

RolService 
( 
IGenericRepository ,
<, -
Rol- 0
>0 1

repository2 <
)< =
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
List 
< 
Rol "
>" #
># $
Lista% *
(* +
)+ ,
{ 	

IQueryable 
< 
Rol 
> 
query !
=" #
await$ )
_repository* 5
.5 6
	Consultar6 ?
(? @
)@ A
;A B
return 
query 
. 
ToList 
(  
)  !
;! "
} 	
} 
} ¶A
ÉC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Implementacion\UsuarioService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 
Implementacion ,
{ 
public 

class 
UsuarioService 
:  !
IUsuarioService" 1
{ 
private 
readonly 
IGenericRepository +
<+ ,
Usuario, 3
>3 4
_repository5 @
;@ A
private 
readonly 
IUtilidadesService +
_utilidadesService, >
;> ?
public 
UsuarioService 
( 
IGenericRepository 0
<0 1
Usuario1 8
>8 9

repository: D
,D E
IUtilidadesServiceF X
utilidadesServiceY j
)j k
{ 	
_repository 
= 

repository $
;$ %
_utilidadesService 
=  
utilidadesService! 2
;2 3
} 	
public 
async 
Task 
< 
Usuario !
>! "
Crear# (
(( )
Usuario) 0
entidad1 8
)8 9
{ 	
Usuario 
usuario 
= 
await #
_repository$ /
./ 0
Obtener0 7
(7 8
u8 9
=>: <
u= >
.> ?
	Documento? H
==I K
entidadL S
.S T
	DocumentoT ]
)] ^
;^ _
if 
( 
usuario 
!= 
null 
)  
{ 
throw 
new !
TaskCanceledException /
(/ 0
$str0 F
)F G
;G H
}   
try"" 
{## 
entidad$$ 
.$$ 
Clave$$ 
=$$ 
_utilidadesService$$  2
.$$2 3
ConvertirSha256$$3 B
($$B C
entidad$$C J
.$$J K
Clave$$K P
)$$P Q
;$$Q R
Usuario&& 
usuario_creado&& &
=&&' (
await&&) .
_repository&&/ :
.&&: ;
Crear&&; @
(&&@ A
entidad&&A H
)&&H I
;&&I J
if(( 
((( 
usuario_creado(( "
.((" #
	Documento((# ,
==((- /
$num((0 1
)((1 2
throw)) 
new)) !
TaskCanceledException)) 3
())3 4
$str))4 Q
)))Q R
;))R S

IQueryable,, 
<,, 
Usuario,, "
>,," #
query,,$ )
=,,* +
await,,, 1
_repository,,2 =
.,,= >
	Consultar,,> G
(,,G H
u,,H I
=>,,J L
u,,M N
.,,N O
	Documento,,O X
==,,Y [
usuario_creado,,\ j
.,,j k
	Documento,,k t
),,t u
;,,u v
usuario_creado-- 
=--  
query--! &
.--& '
Include--' .
(--. /
r--/ 0
=>--1 3
r--4 5
.--5 6
IdRolNavigation--6 E
)--E F
.--F G
First--G L
(--L M
)--M N
;--N O
return// 
usuario_creado// %
;//% &
}00 
catch11 
(11 
	Exception11 
)11 
{22 
throw33 
;33 
}44 
}55 	
public77 
async77 
Task77 
<77 
Usuario77 !
>77! "

Desactivar77# -
(77- .
Usuario77. 5
entidad776 =
)77= >
{88 	
try99 
{:: 

IQueryable;; 
<;; 
Usuario;; "
>;;" #
	queryUser;;$ -
=;;. /
await;;0 5
_repository;;6 A
.;;A B
	Consultar;;B K
(;;K L
u;;L M
=>;;N P
u;;Q R
.;;R S
	Documento;;S \
==;;] _
entidad;;` g
.;;g h
	Documento;;h q
);;q r
;;;r s
Usuario== 
usuario_editar== &
===' (
	queryUser==) 2
.==2 3
First==3 8
(==8 9
)==9 :
;==: ;
usuario_editar?? 
.?? 
Estado?? %
=??& '
entidad??( /
.??/ 0
Estado??0 6
;??6 7
boolAA 
	respuestaAA 
=AA  
awaitAA! &
_repositoryAA' 2
.AA2 3
EditarAA3 9
(AA9 :
usuario_editarAA: H
)AAH I
;AAI J
ifCC 
(CC 
!CC 
	respuestaCC 
)CC 
throwDD 
newDD !
TaskCanceledExceptionDD 3
(DD3 4
$strDD4 T
)DDT U
;DDU V
UsuarioFF 
editadoFF 
=FF  !
	queryUserFF" +
.FF+ ,
IncludeFF, 3
(FF3 4
rFF4 5
=>FF6 8
rFF9 :
.FF: ;
IdRolNavigationFF; J
)FFJ K
.FFK L
FirstFFL Q
(FFQ R
)FFR S
;FFS T
returnHH 
editadoHH 
;HH 
}II 
catchJJ 
(JJ 
	ExceptionJJ 
)JJ 
{KK 
throwLL 
;LL 
}MM 
}NN 	
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
ListQQ 
<QQ 
UsuarioQQ &
>QQ& '
>QQ' (
ListaQQ) .
(QQ. /
)QQ/ 0
{RR 	

IQueryableSS 
<SS 
UsuarioSS 
>SS 
querySS  %
=SS& '
awaitSS( -
_repositorySS. 9
.SS9 :
	ConsultarSS: C
(SSC D
)SSD E
;SSE F
returnTT 
queryTT 
.TT 
IncludeTT  
(TT  !
rTT! "
=>TT# %
rTT& '
.TT' (
IdRolNavigationTT( 7
)TT7 8
.TT8 9
ToListTT9 ?
(TT? @
)TT@ A
;TTA B
}UU 	
publicWW 
asyncWW 
TaskWW 
<WW 
UsuarioWW !
>WW! ""
ObtenerPorCredencialesWW# 9
(WW9 :
intWW: =
	documentoWW> G
,WWG H
stringWWI O
claveWWP U
)WWU V
{XX 	
stringYY 

encriptadaYY 
=YY 
_utilidadesServiceYY  2
.YY2 3
ConvertirSha256YY3 B
(YYB C
claveYYC H
)YYH I
;YYI J
Usuario[[ 

encontrado[[ 
=[[  
await[[! &
_repository[[' 2
.[[2 3
Obtener[[3 :
([[: ;
u[[; <
=>[[= ?
u[[@ A
.[[A B
	Documento[[B K
==[[L N
	documento[[O X
&&[[Y [
u[[\ ]
.[[] ^
Clave[[^ c
.[[c d
Equals[[d j
([[j k

encriptada[[k u
)[[u v
)[[v w
;[[w x
return]] 

encontrado]] 
;]] 
}^^ 	
public`` 
async`` 
Task`` 
<`` 
Usuario`` !
>``! "
ObtenerPorId``# /
(``/ 0
int``0 3
	idUsuario``4 =
)``= >
{aa 	

IQueryablebb 
<bb 
Usuariobb 
>bb 
querybb  %
=bb& '
awaitbb( -
_repositorybb. 9
.bb9 :
	Consultarbb: C
(bbC D
ubbD E
=>bbF H
ubbI J
.bbJ K
	DocumentobbK T
==bbU W
	idUsuariobbX a
)bba b
;bbb c
Usuariodd 
	resultadodd 
=dd 
querydd  %
.dd% &
Includedd& -
(dd- .
rdd. /
=>dd0 2
rdd3 4
.dd4 5
IdRolNavigationdd5 D
)ddD E
.ddE F
FirstOrDefaultddF T
(ddT U
)ddU V
;ddV W
returnff 
	resultadoff 
;ff 
}gg 	
}hh 
}ii ’
}C:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Interfaces\IMenuService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 

Interfaces (
{		 
public

 

	interface

 
IMenuService

 !
{ 
Task 
< 
List 
< 
Menu 
> 
> 
ObtenerMenu $
($ %
int% (
	idUsuario) 2
)2 3
;3 4
} 
} ‚
ÑC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Interfaces\IEstadisticaService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 

Interfaces (
{		 
public

 

	interface

 
IEstadisticaService

 (
{ 
Task 
< 
List 
< 
Usuario 
> 
> 
Lista !
(! "
)" #
;# $
Task 
< 
Estadistica 
> 
Crear 
(  
Estadistica  +
entidad, 3
)3 4
;4 5
Task 
< 
Estadistica 
> 
Editar  
(  !
Estadistica! ,
entidad- 4
)4 5
;5 6
Task 
< 
Estadistica 
> 
ObtenerJugador (
(( )
int) ,
	documento- 6
)6 7
;7 8
} 
} Ò"
ÄC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Implementacion\MenuService.cs
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
BLL

 
.

 
Implementacion

 ,
{ 
public 

class 
MenuService 
: 
IMenuService +
{ 
private 
readonly 
IGenericRepository +
<+ ,
Menu, 0
>0 1
_repositoryMenu2 A
;A B
private 
readonly 
IGenericRepository +
<+ ,
RolMenu, 3
>3 4
_repositoryRol5 C
;C D
private 
readonly 
IGenericRepository +
<+ ,
Usuario, 3
>3 4
_repositoryUser5 D
;D E
public 
MenuService 
( 
IGenericRepository -
<- .
Menu. 2
>2 3
repositoryMenu4 B
,B C
IGenericRepositoryD V
<V W
RolMenuW ^
>^ _
repositoryRol` m
,m n
IGenericRepository	o Å
<
Å Ç
Usuario
Ç â
>
â ä
repositoryUser
ã ô
)
ô ö
{ 	
_repositoryMenu 
= 
repositoryMenu ,
;, -
_repositoryRol 
= 
repositoryRol *
;* +
_repositoryUser 
= 
repositoryUser ,
;, -
} 	
public 
async 
Task 
< 
List 
< 
Menu #
># $
>$ %
ObtenerMenu& 1
(1 2
int2 5
	idUsuario6 ?
)? @
{ 	

IQueryable 
< 
Usuario 
> 
	tbUsuario  )
=* +
await, 1
_repositoryUser2 A
.A B
	ConsultarB K
(K L
uL M
=>N P
uQ R
.R S
	DocumentoS \
==] _
	idUsuario` i
)i j
;j k

IQueryable 
< 
RolMenu 
> 
tbRol  %
=& '
await( -
_repositoryRol. <
.< =
	Consultar= F
(F G
)G H
;H I

IQueryable 
< 
Menu 
> 
tbMenu #
=$ %
await& +
_repositoryMenu, ;
.; <
	Consultar< E
(E F
)F G
;G H

IQueryable 
< 
Menu 
> 
	MenuPadre &
=' (
() *
from* .
u/ 0
in1 3
	tbUsuario4 =
join  * .
rm  / 1
in  2 4
tbRol  5 :
on  ; =
u  > ?
.  ? @
IdRol  @ E
equals  F L
rm  M O
.  O P
IdRol  P U
join!!* .
m!!/ 0
in!!1 3
tbMenu!!4 :
on!!; =
rm!!> @
.!!@ A
IdMenu!!A G
equals!!H N
m!!O P
.!!P Q
Id!!Q S
select""* 0
m""1 2
)""2 3
.""3 4
Distinct""4 <
(""< =
)""= >
.""> ?
AsQueryable""? J
(""J K
)""K L
;""L M
List$$ 
<$$ 
Menu$$ 
>$$ 
menus$$ 
=$$ 
($$  
from$$  $
mpadre$$% +
in$$, .
	MenuPadre$$/ 8
select%%  &
new%%' *
Menu%%+ /
(%%/ 0
)%%0 1
{&&  !
Nombre''$ *
=''+ ,
mpadre''- 3
.''3 4
Nombre''4 :
,'': ;
Icono(($ )
=((* +
mpadre((, 2
.((2 3
Icono((3 8
,((8 9
Controlador))$ /
=))0 1
mpadre))2 8
.))8 9
Controlador))9 D
,))D E
PaginaAccion**$ 0
=**1 2
mpadre**3 9
.**9 :
PaginaAccion**: F
}++  !
)++! "
.++" #
ToList++# )
(++) *
)++* +
;+++ ,
return,, 
menus,, 
;,, 
}-- 	
}// 
}00 ∂2
áC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Implementacion\EstadisticaService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 
Implementacion ,
{ 
public 

class 
EstadisticaService #
:$ %
IEstadisticaService& 9
{ 
private 
readonly 
IGenericRepository +
<+ ,
Estadistica, 7
>7 8"
_repositoryEstadistica9 O
;O P
private 
readonly 
IGenericRepository +
<+ ,
Usuario, 3
>3 4
_repositoryUsuario5 G
;G H
public 
EstadisticaService !
(! "
IGenericRepository" 4
<4 5
Usuario5 <
>< =
repositoryUsuario> O
,O P
IGenericRepositoryQ c
<c d
Estadisticad o
>o p"
repositoryEstadistica	q Ü
)
Ü á
{ 	
_repositoryUsuario 
=  
repositoryUsuario! 2
;2 3"
_repositoryEstadistica "
=# $!
repositoryEstadistica% :
;: ;
} 	
public 
async 
Task 
< 
Estadistica %
>% &
Crear' ,
(, -
Estadistica- 8
entidad9 @
)@ A
{ 	
try 
{ 
Estadistica 
estadistica_creado .
=/ 0
await1 6"
_repositoryEstadistica7 M
.M N
CrearN S
(S T
entidadT [
)[ \
;\ ]
if 
( 
estadistica_creado &
.& '
Id' )
==* ,
$num- .
). /
throw   
new   !
TaskCanceledException   3
(  3 4
$str  4 W
)  W X
;  X Y
return"" 
estadistica_creado"" )
;"") *
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
throw&& 
;&& 
}'' 
}(( 	
public** 
async** 
Task** 
<** 
Estadistica** %
>**% &
Editar**' -
(**- .
Estadistica**. 9
entidad**: A
)**A B
{++ 	
try,, 
{-- 

IQueryable.. 
<.. 
Estadistica.. &
>..& '
	queryUser..( 1
=..2 3
await..4 9"
_repositoryEstadistica..: P
...P Q
	Consultar..Q Z
(..Z [
u..[ \
=>..] _
u..` a
...a b
	IdUsuario..b k
==..l n
entidad..o v
...v w
	IdUsuario	..w Ä
)
..Ä Å
;
..Å Ç
Estadistica00 
editar00 "
=00# $
	queryUser00% .
.00. /
First00/ 4
(004 5
)005 6
;006 7
editar22 
.22 
PartidosJugados22 &
=22' (
entidad22) 0
.220 1
PartidosJugados221 @
;22@ A
editar33 
.33 
Goles33 
=33 
entidad33 &
.33& '
Goles33' ,
;33, -
editar44 
.44 
Asistencias44 "
=44# $
entidad44% ,
.44, -
Asistencias44- 8
;448 9
editar55 
.55 
	Amarillas55  
=55! "
entidad55# *
.55* +
	Amarillas55+ 4
;554 5
editar66 
.66 
Rojas66 
=66 
entidad66 &
.66& '
Rojas66' ,
;66, -
bool88 
	respuesta88 
=88  
await88! &"
_repositoryEstadistica88' =
.88= >
Editar88> D
(88D E
editar88E K
)88K L
;88L M
if:: 
(:: 
!:: 
	respuesta:: 
):: 
throw;; 
new;; !
TaskCanceledException;; 3
(;;3 4
$str;;4 V
);;V W
;;;W X
return== 
editar== 
;== 
}>> 
catch?? 
(?? 
	Exception?? 
)?? 
{@@ 
throwAA 
;AA 
}BB 
}CC 	
publicFF 
asyncFF 
TaskFF 
<FF 
ListFF 
<FF 
UsuarioFF &
>FF& '
>FF' (
ListaFF) .
(FF. /
)FF/ 0
{GG 	

IQueryableHH 
<HH 
UsuarioHH 
>HH 
queryHH  %
=HH& '
awaitHH( -
_repositoryUsuarioHH. @
.HH@ A
	ConsultarHHA J
(HHJ K
)HHK L
;HHL M
returnII 
queryII 
.II 
IncludeII  
(II  !
rII! "
=>II# %
rII& '
.II' (
IdRolNavigationII( 7
)II7 8
.II8 9
WhereII9 >
(II> ?
uII? @
=>IIA C
uIID E
.IIE F
IdRolIIF K
==IIL N
$numIIO P
&&IIQ S
uIIT U
.IIU V
EstadoIIV \
)II\ ]
.II] ^
ToListII^ d
(IId e
)IIe f
;IIf g
}JJ 	
publicLL 
asyncLL 
TaskLL 
<LL 
EstadisticaLL %
>LL% &
ObtenerJugadorLL' 5
(LL5 6
intLL6 9
	documentoLL: C
)LLC D
{MM 	

IQueryableNN 
<NN 
EstadisticaNN "
>NN" #
queryNN$ )
=NN* +
awaitNN, 1"
_repositoryEstadisticaNN2 H
.NNH I
	ConsultarNNI R
(NNR S
)NNS T
;NNT U
EstadisticaOO 
jugadorOO 
=OO  !
queryOO" '
.OO' (
WhereOO( -
(OO- .
uOO. /
=>OO0 2
uOO3 4
.OO4 5
	IdUsuarioOO5 >
==OO? A
	documentoOOB K
)OOK L
.OOL M
FirstOOM R
(OOR S
)OOS T
;OOT U
returnPP 
jugadorPP 
;PP 
}QQ 	
}RR 
}SS ‘
ÜC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Implementacion\UtilidadesService.cs
	namespace		 	
SistemaDeportes		
 
.		 
BLL		 
.		 
Implementacion		 ,
{

 
public 

class 
UtilidadesService "
:# $
IUtilidadesService% 7
{ 
public 
string 
ConvertirSha256 %
(% &
string& ,
texto- 2
)2 3
{ 	
StringBuilder 
sb 
= 
new "
StringBuilder# 0
(0 1
)1 2
;2 3
using 
( 
SHA256 
hash 
=  
SHA256Managed! .
.. /
Create/ 5
(5 6
)6 7
)7 8
{ 
Encoding 
end 
= 
Encoding '
.' (
UTF8( ,
;, -
byte 
[ 
] 
result 
= 
hash  $
.$ %
ComputeHash% 0
(0 1
end1 4
.4 5
GetBytes5 =
(= >
texto> C
)C D
)D E
;E F
foreach 
( 
byte 
b 
in  "
result# )
)) *
{ 
sb 
. 
Append 
( 
b 
.  
ToString  (
(( )
$str) -
)- .
). /
;/ 0
} 
} 
return 
sb 
. 
ToString 
( 
)  
;  !
} 	
public 
string 
GenerarClave "
(" #
)# $
{   	
string!! 
clave!! 
=!! 
Guid!! 
.!!  
NewGuid!!  '
(!!' (
)!!( )
.!!) *
ToString!!* 2
(!!2 3
$str!!3 6
)!!6 7
.!!7 8
	Substring!!8 A
(!!A B
$num!!B C
,!!C D
$num!!E F
)!!F G
;!!G H
return"" 
clave"" 
;"" 
}## 	
}$$ 
}%% º

ÄC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Interfaces\IUsuarioService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 

Interfaces (
{		 
public

 

	interface

 
IUsuarioService

 $
{ 
Task 
< 
List 
< 
Usuario 
> 
> 
Lista !
(! "
)" #
;# $
Task 
< 
Usuario 
> 
Crear 
( 
Usuario #
entidad$ +
)+ ,
;, -
Task 
< 
Usuario 
> 

Desactivar  
(  !
Usuario! (
entidad) 0
)0 1
;1 2
Task 
< 
Usuario 
> "
ObtenerPorCredenciales ,
(, -
int- 0
	documento1 :
,: ;
string< B
claveC H
)H I
;I J
Task 
< 
Usuario 
> 
ObtenerPorId "
(" #
int# &
	idUsuario' 0
)0 1
;1 2
} 
} ¯5
ÜC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Implementacion\InventarioService.cs
	namespace 	
SistemaDeportes
 
. 
BLL 
. 
Implementacion ,
{ 
public 

class 
InventarioService "
:# $
IInventarioService% 7
{ 
private 
readonly 
IGenericRepository +
<+ ,
Elemento_Inventario, ?
>? @
_repositoryA L
;L M
public 
InventarioService  
(  !
IGenericRepository! 3
<3 4
Elemento_Inventario4 G
>G H

repositoryI S
)S T
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
Elemento_Inventario -
>- .
Crear/ 4
(4 5
Elemento_Inventario5 H
entidadI P
)P Q
{ 	
Elemento_Inventario 
elemento  (
=) *
await+ 0
_repository1 <
.< =
Obtener= D
(D E
uE F
=>G I
uJ K
.K L
CodigoL R
==S U
entidadV ]
.] ^
Codigo^ d
)d e
;e f
if 
( 
elemento 
!= 
null  
)  !
{ 
throw 
new !
TaskCanceledException /
(/ 0
$str0 G
)G H
;H I
} 
try 
{   
Elemento_Inventario!! #
elemento_creado!!$ 3
=!!4 5
await!!6 ;
_repository!!< G
.!!G H
Crear!!H M
(!!M N
entidad!!N U
)!!U V
;!!V W
if## 
(## 
elemento_creado## #
.### $
Codigo##$ *
==##+ -
$num##. /
)##/ 0
throw$$ 
new$$ !
TaskCanceledException$$ 3
($$3 4
$str$$4 T
)$$T U
;$$U V

IQueryable'' 
<'' 
Elemento_Inventario'' .
>''. /
query''0 5
=''6 7
await''8 =
_repository''> I
.''I J
	Consultar''J S
(''S T
u''T U
=>''V X
u''Y Z
.''Z [
Codigo''[ a
==''b d
elemento_creado''e t
.''t u
Codigo''u {
)''{ |
;''| }
return)) 
elemento_creado)) &
;))& '
}** 
catch++ 
(++ 
	Exception++ 
)++ 
{,, 
throw-- 
;-- 
}.. 
}// 	
public11 
async11 
Task11 
<11 
Elemento_Inventario11 -
>11- .
Editar11/ 5
(115 6
Elemento_Inventario116 I
entidad11J Q
)11Q R
{22 	
try33 
{44 

IQueryable55 
<55 
Elemento_Inventario55 .
>55. /
queryElemento550 =
=55> ?
await55@ E
_repository55F Q
.55Q R
	Consultar55R [
(55[ \
u55\ ]
=>55^ `
u55a b
.55b c
Codigo55c i
==55j l
entidad55m t
.55t u
Codigo55u {
)55{ |
;55| }
Elemento_Inventario77 #
elemento_editar77$ 3
=774 5
queryElemento776 C
.77C D
First77D I
(77I J
)77J K
;77K L
elemento_editar99 
.99  
Nombre99  &
=99' (
entidad99) 0
.990 1
Nombre991 7
;997 8
elemento_editar:: 
.::  
Marca::  %
=::& '
entidad::( /
.::/ 0
Marca::0 5
;::5 6
elemento_editar;; 
.;;  
Cantidad;;  (
=;;) *
entidad;;+ 2
.;;2 3
Cantidad;;3 ;
;;;; <
elemento_editar<< 
.<<  
	IdUsuario<<  )
=<<* +
entidad<<, 3
.<<3 4
	IdUsuario<<4 =
;<<= >
bool?? 
	respuesta?? 
=??  
await??! &
_repository??' 2
.??2 3
Editar??3 9
(??9 :
elemento_editar??: I
)??I J
;??J K
ifAA 
(AA 
!AA 
	respuestaAA 
)AA 
throwBB 
newBB !
TaskCanceledExceptionBB 3
(BB3 4
$strBB4 P
)BBP Q
;BBQ R
returnDD 
elemento_editarDD &
;DD& '
}EE 
catchFF 
(FF 
	ExceptionFF 
)FF 
{GG 
throwHH 
;HH 
}II 
}JJ 	
publicMM 
asyncMM 
TaskMM 
<MM 
ListMM 
<MM 
Elemento_InventarioMM 2
>MM2 3
>MM3 4
ListaMM5 :
(MM: ;
)MM; <
{NN 	

IQueryableOO 
<OO 
Elemento_InventarioOO *
>OO* +
queryOO, 1
=OO2 3
awaitOO4 9
_repositoryOO: E
.OOE F
	ConsultarOOF O
(OOO P
)OOP Q
;OOQ R
returnPP 
queryPP 
.PP 
ToListPP 
(PP  
)PP  !
;PP! "
}QQ 	
publicSS 
asyncSS 
TaskSS 
<SS 
boolSS 
>SS 
EliminarSS  (
(SS( )
intSS) ,
codigoSS- 3
)SS3 4
{TT 	
tryUU 
{VV 
Elemento_InventarioWW #

encontradoWW$ .
=WW/ 0
awaitWW1 6
_repositoryWW7 B
.WWB C
ObtenerWWC J
(WWJ K
uWWK L
=>WWM O
uWWP Q
.WWQ R
CodigoWWR X
==WWY [
codigoWW\ b
)WWb c
;WWc d
ifYY 
(YY 

encontradoYY 
==YY !
nullYY" &
)YY& '
throwZZ 
newZZ !
TaskCanceledExceptionZZ 3
(ZZ3 4
$strZZ4 K
)ZZK L
;ZZL M
bool\\ 
	respuesta\\ 
=\\  
await\\! &
_repository\\' 2
.\\2 3
Eliminar\\3 ;
(\\; <

encontrado\\< F
)\\F G
;\\G H
return^^ 
true^^ 
;^^ 
}__ 
catch`` 
(`` 
	Exception`` 
)`` 
{aa 
throwbb 
;bb 
}cc 
}dd 	
}ee 
}ff Í#
ÇC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.BLL\Implementacion\EventoService.cs
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
BLL

 
.

 
Implementacion

 ,
{ 
public 

class 
EventoService 
:  
IEventoService! /
{ 
private 
readonly 
IGenericRepository +
<+ ,
Evento, 2
>2 3
_repository4 ?
;? @
public 
EventoService 
( 
IGenericRepository /
</ 0
Evento0 6
>6 7

repository8 B
)B C
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
Evento  
>  !
Crear" '
(' (
Evento( .
entidad/ 6
)6 7
{ 	
Evento 
evento 
= 
await !
_repository" -
.- .
Obtener. 5
(5 6
u6 7
=>8 :
u; <
.< =
Id= ?
==@ B
entidadC J
.J K
IdK M
)M N
;N O
if 
( 
evento 
!= 
null 
) 
{ 
throw 
new !
TaskCanceledException /
(/ 0
$str0 E
)E F
;F G
} 
try 
{ 
Evento   
evento_creado   $
=  % &
await  ' ,
_repository  - 8
.  8 9
Crear  9 >
(  > ?
entidad  ? F
)  F G
;  G H
if"" 
("" 
evento_creado"" !
.""! "
Id""" $
==""% '
$num""( )
)"") *
throw## 
new## !
TaskCanceledException## 3
(##3 4
$str##4 P
)##P Q
;##Q R

IQueryable&& 
<&& 
Evento&& !
>&&! "
query&&# (
=&&) *
await&&+ 0
_repository&&1 <
.&&< =
	Consultar&&= F
(&&F G
u&&G H
=>&&I K
u&&L M
.&&M N
Id&&N P
==&&Q S
evento_creado&&T a
.&&a b
Id&&b d
)&&d e
;&&e f
return(( 
evento_creado(( $
;(($ %
})) 
catch** 
(** 
	Exception** 
)** 
{++ 
throw,, 
;,, 
}-- 
}.. 	
public11 
async11 
Task11 
<11 
List11 
<11 
Evento11 %
>11% &
>11& '
Lista11( -
(11- .
)11. /
{22 	

IQueryable33 
<33 
Evento33 
>33 
query33 $
=33% &
await33' ,
_repository33- 8
.338 9
	Consultar339 B
(33B C
)33C D
;33D E
return44 
query44 
.44 
ToList44 
(44  
)44  !
;44! "
}55 	
public77 
async77 
Task77 
<77 
bool77 
>77 
Eliminar77  (
(77( )
int77) ,
id77- /
)77/ 0
{88 	
try99 
{:: 
Evento;; 

encontrado;; !
=;;" #
await;;$ )
_repository;;* 5
.;;5 6
Obtener;;6 =
(;;= >
u;;> ?
=>;;@ B
u;;C D
.;;D E
Id;;E G
==;;H J
id;;K M
);;M N
;;;N O
if== 
(== 

encontrado== 
==== !
null==" &
)==& '
throw>> 
new>> !
TaskCanceledException>> 3
(>>3 4
$str>>4 I
)>>I J
;>>J K
bool@@ 
	respuesta@@ 
=@@  
await@@! &
_repository@@' 2
.@@2 3
Eliminar@@3 ;
(@@; <

encontrado@@< F
)@@F G
;@@G H
returnBB 
trueBB 
;BB 
}CC 
catchDD 
(DD 
	ExceptionDD 
)DD 
{EE 
throwFF 
;FF 
}GG 
}HH 	
}II 
}JJ 