Ï
qC:\Users\USUARIO\Documents\VS Code Workspace\Workspace Backend\SistemaDeportes\SistemaDeportes.IOC\Dependencia.cs
	namespace 	
SistemaDeportes
 
. 
IOC 
{ 
public 

static 
class 
Dependencia #
{ 
public 
static 
void 
InyectarDependencia .
(. /
this/ 3
IServiceCollection4 F
servicesG O
,O P
IConfigurationQ _
Configuration` m
)m n
{ 	
services 
. 
AddDbContext !
<! "
dbdeportesContext" 3
>3 4
(4 5
options5 <
=>= ?
{ 
options 
. 
UseSqlServer $
($ %
Configuration% 2
.2 3
GetConnectionString3 F
(F G
$strG R
)R S
)S T
;T U
} 
) 
; 
services 
. 
AddTransient !
(! "
typeof" (
(( )
IGenericRepository) ;
<; <
>< =
)= >
,> ?
typeof@ F
(F G
GenericRepositoryG X
<X Y
>Y Z
)Z [
)[ \
;\ ]
services 
. 
	AddScoped 
< 
IUtilidadesService 1
,1 2
UtilidadesService3 D
>D E
(E F
)F G
;G H
services 
. 
	AddScoped 
< 
IRolService *
,* +

RolService, 6
>6 7
(7 8
)8 9
;9 :
services   
.   
	AddScoped   
<   
IUsuarioService   .
,  . /
UsuarioService  0 >
>  > ?
(  ? @
)  @ A
;  A B
services"" 
."" 
	AddScoped"" 
<"" 
IInventarioService"" 1
,""1 2
InventarioService""3 D
>""D E
(""E F
)""F G
;""G H
services$$ 
.$$ 
	AddScoped$$ 
<$$ 
IEventoService$$ -
,$$- .
EventoService$$/ <
>$$< =
($$= >
)$$> ?
;$$? @
services&& 
.&& 
	AddScoped&& 
<&& 
IEstadisticaService&& 2
,&&2 3
EstadisticaService&&4 F
>&&F G
(&&G H
)&&H I
;&&I J
services(( 
.(( 
	AddScoped(( 
<(( 
IMenuService(( +
,((+ ,
MenuService((- 8
>((8 9
(((9 :
)((: ;
;((; <
})) 	
}** 
}++ 