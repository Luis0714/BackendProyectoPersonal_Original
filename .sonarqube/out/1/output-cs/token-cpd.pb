Ö
^C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Behaviours\ValidationBehavior.cs
	namespace 	
Application
 
. 

Behaviours  
{ 
public 

class 
ValidationBehavior #
<# $
TRequest$ ,
,, -
	TResponse. 7
>7 8
:9 :
IPipelineBehavior; L
<L M
TRequestM U
,U V
	TResponseW `
>` a
whereb g
TRequesth p
:q r
IRequests {
<{ |
	TResponse	| Ö
>
Ö Ü
{ 
private 
readonly 
IEnumerable $
<$ %

IValidator% /
</ 0
TRequest0 8
>8 9
>9 :
_validators; F
;F G
public

 
ValidationBehavior

 !
(

! "
IEnumerable

" -
<

- .

IValidator

. 8
<

8 9
TRequest

9 A
>

A B
>

B C

validators

D N
)

N O
{ 	
_validators 
= 

validators $
;$ %
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< ="
RequestHandlerDelegate> T
<T U
	TResponseU ^
>^ _
next` d
,d e
CancellationTokenf w
cancellationToken	x â
)
â ä
{ 	
if 
( 
_validators 
. 
Any 
( 
)  
)  !
{ 
var 
context 
= 
new !
FluentValidation" 2
.2 3
ValidationContext3 D
<D E
TRequestE M
>M N
(N O
requestO V
)V W
;W X
var 
validatorResults $
=% &
await' ,
Task- 1
.1 2
WhenAll2 9
(9 :
_validators: E
.E F
SelectF L
(L M

validationM W
=>X Z

validation[ e
.e f
ValidateAsyncf s
(s t
contextt {
,{ |
cancellationToken	} é
)
é è
)
è ê
)
ê ë
;
ë í
var 
failures 
= 
validatorResults /
./ 0

SelectMany0 :
(: ;
error; @
=>A C
errorD I
.I J
ErrorsJ P
)P Q
.Q R
WhereR W
(W X
errorX ]
=>^ `
errora f
!=g i
nullj n
)n o
.o p
ToListp v
(v w
)w x
;x y
if 
( 
failures 
. 
Count "
!=# %
$num& '
)' (
throw 
new 
Execteptions *
.* +
ValidationException+ >
(> ?
failures? G
)G H
;H I
} 
return 
await 
next 
( 
) 
;  
} 	
} 
} ¿
XC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Constants\PasswordConst.cs
	namespace 	
Application
 
. 
	Constants 
{ 
public 

static 
class 
PasswordConst %
{ 
public 
const 
string 
Characteres '
=( )
$str* j
;j k
} 
} π
TC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Constants\UserConst.cs
	namespace 	
Application
 
. 
	Constants 
{ 
public 

static 
class 
	UserConst !
{ 
public 
const 
string 
defaultImage (
=) *
$str+ V
;V W
} 
} À
OC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\DTO's\AdminDTO.cs
	namespace 	
Application
 
. 
DTO_s 
{ 
public 

class 
AdminDTO 
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ¯
VC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\DTO's\FileDownloadDTO.cs
	namespace 	
Application
 
. 
DTO_s 
{ 
public 

class 
FileDownloadDTO  
{ 
public 
Byte 
[ 
] 
Bytes 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
ContentType !
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} »
NC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\DTO's\FileDTO.cs
	namespace 	
Application
 
. 
DTO_s 
{ 
public 

class 
FileDTO 
{ 
public 
	IFormFile 
Image 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Ruta 
{ 
get  
;  !
set" %
;% &
}' (
}		 
}

 ˙
MC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\DTO's\JwtDTO.cs
	namespace 	
Application
 
. 
DTO_s 
{ 
public 

class 
JwtDTO 
{ 
public 
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Audience 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Subject 
{ 
get  #
;# $
set% (
;( )
}* +
}		 
}

 É
NC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\DTO's\UserDTO.cs
	namespace 	
Application
 
. 
DTO_s 
{ 
public 

class 
UserDTO 
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
?		 
SecondLastName		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
DateTime

 
DateOfBirth

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
string 
numberPhone !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Document 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
DocumentTypeId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
RolId 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
Edad 
{ 
get 
; 
set !
;! "
}# $
} 
} ∑
SC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Enums\Rols\EnumRol.cs
	namespace 	
Application
 
. 
Enums 
. 
Rols  
{ 
public 

enum 
EnumRol 
{ 

SuperAdmin 
= 
$num 
, 
Usuario 
= 
$num 
} 
} 
gC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Espesification\GetAllUserSpecification.cs
	namespace 	
Application
 
. 
Espesification $
{ 
public 

class #
GetAllUserSpecification (
:( )
Specification* 7
<7 8
User8 <
>< =
{ 
public #
GetAllUserSpecification &
(& '
)' (
{		 	
Query

 
.

 
Where

 
(

 
user

 
=>

 
user

  $
.

$ %
UserId

% +
!=

, .
null

/ 3
)

3 4
;

4 5
} 	
} 
} Ü

kC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Espesification\GetCurrentUserSpecification.cs
	namespace 	
Application
 
. 
Espesification $
{ 
public 

class '
GetCurrentUserSpecification ,
:, -
Specification. ;
<; <
User< @
>@ A
{ 
public '
GetCurrentUserSpecification *
(* +
string+ 1
Email2 7
,7 8
string9 ?
Password@ H
)H I
{ 	
if		 
(		 
!		 
string		 
.		 
IsNullOrEmpty		 %
(		% &
Email		& +
)		+ ,
&&		- /
!		0 1
string		1 7
.		7 8
IsNullOrEmpty		8 E
(		E F
Password		F N
)		N O
)		O P
Query

 
.

 
Where

 
(

 
user

  
=>

! #
user

$ (
.

( )
Email

) .
==

/ 1
Email

2 7
&&

8 :
user

; ?
.

? @
Password

@ H
==

I K
Password

L T
)

T U
;

U V
} 	
} 
} ¸
^C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Espesification\GetUserByEmail.cs
	namespace 	
Application
 
. 
Espesification $
{ 
public 

class 
GetUserByEmail 
:  !
Specification" /
</ 0
User0 4
>4 5
{ 
public 
GetUserByEmail 
( 
string $
Email% *
)* +
{ 	
Query		 
.		 
Where		 
(		 
user		 
=>		 
user		  $
.		$ %
Email		% *
==		+ -
Email		. 3
)		3 4
;		4 5
}

 	
} 
} ˚
uC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Files\Commands\UploadFile\UploadFileCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Files $
.$ %

UploadFile% /
{ 
public 

class 
UploadFileCommand "
:# $
IRequest% -
<- .
Response. 6
<6 7
string7 =
>= >
>> ?
{ 
public 
	IFormFile 
File 
{ 
get  #
;# $
set% (
;( )
}* +
public 
class $
UploadFileCommandHandler -
:. /
IRequestHandler0 ?
<? @
UploadFileCommand@ Q
,Q R
ResponseS [
<[ \
string\ b
>b c
>c d
{ 	
private 
readonly 
IFileService )
_fileService* 6
;6 7
public $
UploadFileCommandHandler +
(+ ,
IFileService, 8
fileService9 D
,D E
IRepositoryAsyncF V
<V W
UserW [
>[ \
repositoryAsync] l
=m n
nullo s
)s t
{ 
_fileService 
= 
fileService *
;* +
} 
public 
async 
Task 
< 
Response &
<& '
string' -
>- .
>. /
Handle0 6
(6 7
UploadFileCommand7 H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 
string 
ruta 
= 
_fileService *
.* +

UploadFile+ 5
(5 6
request6 =
.= >
File> B
)B C
;C D
return 
new 
Response #
<# $
string$ *
>* +
(+ ,
ruta, 0
,0 1
ruta1 5
)5 6
;6 7
} 
}   	
}!! 
}"" à
wC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Files\Commands\UploadFile\UploadFileValidator.cs
	namespace 	
Application
 
. 
Features 
. 
Files $
.$ %
Commands% -
.- .

UploadFile. 8
{ 
public 

class 
UploadFileValidator $
:% &
AbstractValidator' 8
<8 9
UploadFileCommand9 J
>J K
{ 
public		 
UploadFileValidator		 "
(		" #
)		# $
{

 	
RuleFor 
( 
property 
=> 
property  (
.( )
File) -
)- .
.# $
NotEmpty$ ,
(, -
)- .
.# $
WithMessage$ /
(/ 0
MessageFileErrors0 A
.A B
ImagenRequiredB P
)P Q
;Q R
} 	
} 
} ≠
pC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Files\Querys\DownloasFile\DownloadFile.cs
	namespace 	
Application
 
. 
Features 
. 
Files $
.$ %
Querys% +
{ 
public 

class 
DownloadFile 
: 
IRequest  (
<( )
Response) 1
<1 2
FileDownloadDTO2 A
>A B
>B C
{		 
public

 
string

 
?

 
Ruta

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
} 
public 
class 
DownloadFileHandler  
:! "
IRequestHandler# 2
<2 3
DownloadFile3 ?
,? @
ResponseA I
<I J
FileDownloadDTOJ Y
>Y Z
>Z [
{ 
private 
readonly 
IFileService !
_fileService" .
;. /
public 
DownloadFileHandler "
(" #
IFileService# /
fileService0 ;
); <
{ 	
_fileService 
= 
fileService &
;& '
} 	
public 
async 
Task 
< 
Response "
<" #
FileDownloadDTO# 2
>2 3
>3 4
Handle5 ;
(; <
DownloadFile< H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
if 
( 
request 
. 
Ruta 
!= 
default  '
)' (
{ 
var 
response 
= 
await $
_fileService% 1
.1 2
DownloadFile2 >
(> ?
request? F
.F G
RutaG K
)K L
;L M
return 
new 
Response #
<# $
FileDownloadDTO$ 3
>3 4
(4 5
response5 =
)= >
;> ?
} 
return 
new 
Response 
<  
FileDownloadDTO  /
>/ 0
(0 1
)1 2
;2 3
} 	
} 
}   Î<
ÑC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Commands\ChangePasswordCommand\ChangePasswordCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Commands% -
.- .!
ChangePasswordCommand. C
{ 
public 

class !
ChangePasswordCommand &
:' (
IRequest) 1
<1 2
Response2 :
<: ;
Response; C
?C D
>D E
>E F
{ 
public 
string 
Email 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
CurentPassword $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
NewPassword !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
ComfirmNewPassword (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
public 

class (
ChangePasswordCommandHandler -
:. /
IRequestHandler0 ?
<? @!
ChangePasswordCommand@ U
,U V
ResponseW _
<_ `
Response` h
?h i
>i j
>j k
{ 
private 
readonly 
IRepositoryAsync )
<) *
User* .
>. /
_repositoryAsync0 @
;@ A
private 
readonly 
IMessageSender '
_messageSender( 6
;6 7
private 
readonly 
IPasswordService )
_passwordService* :
;: ;
private 
readonly "
IEncrypPasswordService /"
_encrypPasswordService0 F
;F G
public   (
ChangePasswordCommandHandler   +
(  + ,
IRepositoryAsync  , <
<  < =
User  = A
>  A B
repositoryAsync  C R
,  R S
IMessageSender  T b
messageSender  c p
,  p q
IPasswordService	  r Ç
passwordService
  É í
,
  í ì$
IEncrypPasswordService
  î ™#
encrypPasswordService
  ´ ¿
)
  ¿ ¡
{!! 	
_repositoryAsync"" 
="" 
repositoryAsync"" .
;"". /
_messageSender## 
=## 
messageSender## *
;##* +
_passwordService$$ 
=$$ 
passwordService$$ .
;$$. /"
_encrypPasswordService%% "
=%%# $!
encrypPasswordService%%% :
;%%: ;
}&& 	
public(( 
async(( 
Task(( 
<(( 
Response(( "
<((" #
Response((# +
?((+ ,
>((, -
>((- .
Handle((/ 5
(((5 6!
ChangePasswordCommand((6 K
request((L S
,((S T
CancellationToken((U f
cancellationToken((g x
)((x y
{)) 	
var** 
users** 
=** 
await** 
_repositoryAsync** .
.**. /
	ListAsync**/ 8
(**8 9
new**9 <'
GetCurrentUserSpecification**= X
(**X Y
request**Y `
.**` a
Email**a f
,**f g
request**g n
.**n o
CurentPassword**o }
)**} ~
)**~ 
;	** Ä
var++ 
user++ 
=++ 
users++ 
.++ 
FirstOrDefault++ +
(+++ ,
)++, -
;++- .
if,, 
(,, 
user,, 
==,, 
default,, 
),,  
throw,,! &
new,,' *
ApiException,,+ 7
(,,7 8
MessageUserErrors,,8 I
.,,I J
InvalidCredentials,,J \
),,\ ]
;,,] ^
if-- 
(-- 
request-- 
.-- 
NewPassword-- #
!=--$ &
request--' .
.--. /
ComfirmNewPassword--/ A
)--A B
throw--C H
new--I L
ApiException--M Y
(--Y Z
MessageUserErrors--Z k
.--k l
PasswordNotMach--l {
)--{ |
;--| }
var.. 
newPassword.. 
=.. "
_encrypPasswordService.. 4
...4 5
Encrypt..5 <
(..< =
request..= D
...D E
NewPassword..E P
)..P Q
;..Q R
user// 
.// 
Password// 
=// 
newPassword// '
;//' (
var00 
response00 
=00 
await00  
sendComfirmation00! 1
(001 2
user002 6
)006 7
;007 8
if11 
(11 
response11 
.11 
	Succeeded11 "
)11" #
_repositoryAsync11$ 4
.114 5
UpdateAsync115 @
(11@ A
user11A E
)11E F
;11F G
return22 
response22 
;22 
}33 	
private55 
async55 
Task55 
<55 
Response55 #
<55# $
Response55$ ,
?55, -
>55- .
>55. /
sendComfirmation550 @
(55@ A
User55A E
user55F J
)55J K
{66 	
var77 
to77 
=77 
user77 
.77 
Email77 
;77  
var88 
newPassword88 
=88 
_passwordService88 .
.88. /
GeneretePassword88/ ?
(88? @
$num88@ B
)88B C
;88C D
var99 
templete99 
=99 

Properties99 %
.99% &
	Resources99& /
.99/ 0!
ResetPasswordTemplete990 E
.99E F
ToString99F N
(99N O
)99O P
;99P Q
replaceValues:: 
(:: 
templete:: "
,::" #
user::$ (
,::( )
newPassword::* 5
)::5 6
;::6 7
user;; 
.;; 
Password;; 
=;; "
_encrypPasswordService;; 2
.;;2 3
Encrypt;;3 :
(;;: ;
newPassword;;; F
);;F G
;;;G H
return<< 
await<< 
_messageSender<< '
.<<' (
	SendEmail<<( 1
(<<1 2
to<<2 4
,<<4 5

ConstEmail<<6 @
.<<@ A
NameFromEmail<<A N
,<<N O

ConstEmail<<P Z
.<<Z [
SubjetResetPassword<<[ n
,<<n o
templete<<p x
)<<x y
;<<y z
}== 	
private?? 
string?? 
replaceValues?? $
(??$ %
string??% +
templete??, 4
,??4 5
User??6 :
user??; ?
,??? @
string??A G
newPassword??H S
)??S T
{@@ 	
templeteAA 
=AA 
templeteAA 
.AA  
ReplaceAA  '
(AA' (
$strAA( 1
,AA1 2

ConstEmailAA3 =
.AA= >
SubjetResetPasswordAA> Q
)AAQ R
;AAR S
templeteBB 
=BB 
templeteBB 
.BB  
ReplaceBB  '
(BB' (
$strBB( 1
,BB1 2
userBB3 7
.BB7 8
NameBB8 <
)BB< =
;BB= >
returnCC 
templeteCC 
;CC 
}DD 	
}EE 
}FF †
ÜC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Commands\ChangePasswordCommand\ChangePasswordValidator.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Commands% -
.- .!
ChangePasswordCommand. C
{ 
public 

class #
ChangePasswordValidator (
:) *
AbstractValidator+ <
<< =!
ChangePasswordCommand= R
>R S
{ 
public #
ChangePasswordValidator &
(& '
)' (
{		 	
RuleFor

 
(

 
property

 
=>

 
property

  (
.

( )
Email

) .
)

. /
.& '
NotEmpty' /
(/ 0
)0 1
.& '
WithMessage' 2
(2 3
MessageUserErrors3 D
.D E
NameRequaredE Q
)Q R
;R S
RuleFor 
( 
property 
=> 
property  (
.( )
CurentPassword) 7
)7 8
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
ImageRequaredG T
)T U
;U V
RuleFor 
( 
property 
=> 
property  (
.( )
NewPassword) 4
)4 5
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
ImageRequaredG T
)T U
;U V
RuleFor 
( 
property 
=> 
property  (
.( )
ComfirmNewPassword) ;
); <
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
ImageRequaredG T
)T U
;U V
} 	
} 
} Ú2
{C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Commands\CrateUserCommand\CreateUserCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Commands% -
.- .
CrateUserCommand. >
{ 
public 

class 
CreateUserCommand "
:# $
IRequest% -
<- .
Response. 6
<6 7
UserDTO7 >
>> ?
>? @
{ 
public 
string 
? 
Name 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
? 
Image 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
? 
LastName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
SecondLastName %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
DateOfBirth #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
? 
numberPhone "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 
Document 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
? 
Email 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
DocumentTypeId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
? 
Address 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
RolId 
{ 
get 
; 
set  #
;# $
}% &
} 
public   

class   $
CreateUserCommandHandler   )
:  * +
IRequestHandler  , ;
<  ; <
CreateUserCommand  < M
,  M N
Response  O W
<  W X
UserDTO  X _
>  _ `
>  ` a
{!! 
private## 
readonly## 
IMapper##  
_mapper##! (
;##( )
private$$ 
readonly$$ 
IRepositoryAsync$$ )
<$$) *
User$$* .
>$$. /
_repositoryAsync$$0 @
;$$@ A
private%% 
readonly%% "
IEncrypPasswordService%% /"
_encrypPasswordService%%0 F
;%%F G
public(( $
CreateUserCommandHandler(( '
(((' (
IMapper((( /
mapper((0 6
,((6 7
IRepositoryAsync((8 H
<((H I
User((I M
>((M N
repositoryAsync((O ^
,((^ _"
IEncrypPasswordService((` v"
encrypPasswordService	((w å
)
((å ç
{)) 	
_mapper** 
=** 
mapper** 
;** 
_repositoryAsync++ 
=++ 
repositoryAsync++ .
;++. /"
_encrypPasswordService,, "
=,,# $!
encrypPasswordService,,% :
;,,: ;
}.. 	
public00 
async00 
Task00 
<00 
Response00 "
<00" #
UserDTO00# *
>00* +
>00+ ,
Handle00- 3
(003 4
CreateUserCommand004 E
request00F M
,00M N
CancellationToken00O `
cancellationToken00a r
)00r s
{11 	
var22 
record22 
=22 
_mapper22  
.22  !
Map22! $
<22$ %
User22% )
>22) *
(22* +
request22+ 2
)222 3
;223 4
record33 
.33 
Password33 
=33 "
_encrypPasswordService33 4
.334 5
Encrypt335 <
(33< =
record33= C
.33C D
Password33D L
)33L M
;33M N
var44 
usuarioExistente44  
=44! "
await44# (
_repositoryAsync44) 9
.449 :
	ListAsync44: C
(44C D
new44D G'
GetCurrentUserSpecification44H c
(44c d
request44d k
.44k l
Email44l q
,44q r
record44s y
.44y z
Password	44z Ç
)
44Ç É
)
44É Ñ
;
44Ñ Ö
if55 
(55 
usuarioExistente55  
.55  !
Count55! &
>55' (
$num55) *
)55* +
throw55, 1
new552 5
ApiException556 B
(55B C
MessageUserErrors55C T
.55T U
	UserExist55U ^
)55^ _
;55_ `
if66 
(66 
string66 
.66 
IsNullOrEmpty66 $
(66$ %
record66% +
.66+ ,
Image66, 1
)661 2
)662 3
record664 :
.66: ;
Image66; @
=66A B
	UserConst66C L
.66L M
defaultImage66M Y
;66Y Z
var88 
data88 
=88 
await88 
_repositoryAsync88 -
.88- .
AddAsync88. 6
(886 7
record887 =
)88= >
;88> ?
var99 
result99 
=99 
_mapper99  
.99  !
Map99! $
<99$ %
UserDTO99% ,
>99, -
(99- .
data99. 2
)992 3
;993 4
return:: 
new:: 
Response:: 
<::  
UserDTO::  '
>::' (
(::( )
result::) /
,::/ 0
MessageUserErrors::0 A
.::A B
CreatedUser::B M
)::M N
;::N O
};; 	
}<< 
}== µ!
}C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Commands\CrateUserCommand\CreateUserValidator.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Commands% -
.- .
CrateUserCommand. >
{ 
public 

class 
CreateUserValidator $
:% &
AbstractValidator' 8
<8 9
CreateUserCommand9 J
>J K
{ 
public 
CreateUserValidator "
(" #
)# $
{		 	
RuleFor

 
(

 
property

 
=>

 
property

  (
.

( )
Name

) -
)

- .
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
NameRequaredG S
)S T
;T U
RuleFor 
( 
property 
=> 
property  (
.( )
Image) .
). /
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
ImageRequaredG T
)T U
;U V
RuleFor 
( 
property 
=> 
property  (
.( )
LastName) 1
)1 2
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
LastNameRequaredG W
)W X
;X Y
RuleFor 
( 
property 
=> 
property  (
.( )
DocumentTypeId) 7
)7 8
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G"
DocumentTypeIdRequaredG ]
)] ^
;^ _
RuleFor 
( 
property 
=> 
property  (
.( )
Document) 1
)1 2
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
DocumentRequaredG W
)W X
;X Y
RuleFor 
( 
property 
=> 
property  (
.( )
numberPhone) 4
)4 5
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
NumberPhoneRequaredG Z
)Z [
;[ \
RuleFor 
( 
property 
=> 
property  (
.( )
Email) .
). /
.( )
NotEmpty) 1
(1 2
)2 3
.( )
WithMessage) 4
(4 5
MessageUserErrors5 F
.F G
EmailRequaredG T
)T U
;U V
RuleFor 
( 
property 
=> 
property  (
.( )
Password) 1
)1 2
.  ( )
NotEmpty  ) 1
(  1 2
)  2 3
.!!( )
WithMessage!!) 4
(!!4 5
MessageUserErrors!!5 F
.!!F G
PasswordRequared!!G W
)!!W X
;!!X Y
RuleFor"" 
("" 
property"" 
=>"" 
property""  (
.""( )
RolId"") .
)"". /
.##( )
NotEmpty##) 1
(##1 2
)##2 3
.$$( )
GreaterThan$$) 4
($$4 5
$num$$5 6
)$$6 7
.$$7 8
WithMessage$$8 C
($$C D
MessageUserErrors$$D U
.$$U V
	RolIdCero$$V _
)$$_ `
.%%( )
WithMessage%%) 4
(%%4 5
MessageUserErrors%%5 F
.%%F G
RolIdRequared%%G T
)%%T U
;%%U V
}&& 	
}'' 
}(( Ï3
ÇC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Commands\ResetPasswordCommand\ResetPasswordCommand.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Commands% -
.- .
ResetPassword. ;
{ 
public 

class  
ResetPasswordCommand %
:& '
IRequest( 0
<0 1
Response1 9
<9 :
Response: B
?B C
>C D
>D E
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
public 

class  
ResetPasswordHandler %
:& '
IRequestHandler( 7
<7 8 
ResetPasswordCommand8 L
,L M
ResponseN V
<V W
ResponseW _
?_ `
>` a
>a b
{ 
private 
readonly 
IRepositoryAsync )
<) *
User* .
>. /
_repositoryAsync0 @
;@ A
private 
readonly 
IMessageSender '
_messageSender( 6
;6 7
private 
readonly 
IPasswordService )
_passwordService* :
;: ;
private 
readonly "
IEncrypPasswordService /"
_encrypPasswordService0 F
;F G
public  
ResetPasswordHandler #
(# $
IRepositoryAsync$ 4
<4 5
User5 9
>9 :
repositoryAsync; J
,J K
IMessageSenderL Z
messageSender[ h
,h i
IPasswordServicej z
passwordService	{ ä
,
ä ã$
IEncrypPasswordService
å ¢#
encrypPasswordService
£ ∏
)
∏ π
{ 	
_repositoryAsync 
= 
repositoryAsync .
;. /
_messageSender 
= 
messageSender *
;* +
_passwordService 
= 
passwordService .
;. /"
_encrypPasswordService   "
=  # $!
encrypPasswordService  % :
;  : ;
}!! 	
public## 
async## 
Task## 
<## 
Response## "
<##" #
Response### +
?##+ ,
>##, -
>##- .
Handle##/ 5
(##5 6 
ResetPasswordCommand##6 J
request##K R
,##R S
CancellationToken##T e
cancellationToken##f w
)##w x
{$$ 	
var%% 
lista%% 
=%% 
await%% 
_repositoryAsync%% .
.%%. /
	ListAsync%%/ 8
(%%8 9
new%%9 <
GetUserByEmail%%= K
(%%K L
request%%L S
.%%S T
Email%%T Y
)%%Y Z
)%%Z [
;%%[ \
var&& 
user&& 
=&& 
lista&& 
.&& 
FirstOrDefault&& +
(&&+ ,
)&&, -
;&&- .
if'' 
('' 
user'' 
=='' 
null'' 
)'' 
throw'' #
new''$ '
ApiException''( 4
(''4 5
MessageUserErrors''5 F
.''F G
	UserExist''G P
)''P Q
;''Q R
var(( 
response(( 
=(( 
await((  
sendPassword((! -
(((- .
user((. 2
)((2 3
;((3 4
if)) 
()) 
response)) 
.)) 
	Succeeded)) !
)))! "
_repositoryAsync))# 3
.))3 4
UpdateAsync))4 ?
())? @
user))@ D
)))D E
;))E F
return** 
response** 
;** 
}++ 	
private-- 
async-- 
Task-- 
<-- 
Response-- #
<--# $
Response--$ ,
?--, -
>--- .
>--. /
sendPassword--0 <
(--< =
User--= A
user--B F
)--F G
{.. 	
var// 
to// 
=// 
user// 
.// 
Email// 
;//  
var00 
newPassword00 
=00 
_passwordService00 .
.00. /
GeneretePassword00/ ?
(00? @
$num00@ B
)00B C
;00C D
var11 
templete11 
=11 

Properties11 %
.11% &
	Resources11& /
.11/ 0!
ResetPasswordTemplete110 E
.11E F
ToString11F N
(11N O
)11O P
;11P Q
replaceValues22 
(22 
templete22 "
,22" #
user22$ (
,22( )
newPassword22* 5
)225 6
;226 7
user33 
.33 
Password33 
=33 "
_encrypPasswordService33 2
.332 3
Encrypt333 :
(33: ;
newPassword33; F
)33F G
;33G H
return44 
await44 
_messageSender44 &
.44& '
	SendEmail44' 0
(440 1
to441 3
,443 4

ConstEmail445 ?
.44? @
NameFromEmail44@ M
,44M N

ConstEmail44O Y
.44Y Z
SubjetResetPassword44Z m
,44m n
templete44o w
)44w x
;44x y
}55 	
private77 
string77 
replaceValues77 $
(77$ %
string77% +
templete77, 4
,774 5
User776 :
user77; ?
,77? @
string77A G
newPassword77H S
)77S T
{88 	
templete99 
=99 
templete99 
.99  
Replace99  '
(99' (
$str99( 1
,991 2

ConstEmail993 =
.99= >
SubjetResetPassword99> Q
)99Q R
;99R S
templete:: 
=:: 
templete:: 
.::  
Replace::  '
(::' (
$str::( 1
,::1 2
user::3 7
.::7 8
Name::8 <
)::< =
;::= >
templete;; 
=;; 
templete;; 
.;;  
Replace;;  '
(;;' (
$str;;( 5
,;;5 6
newPassword;;7 B
);;B C
;;;C D
return<< 
templete<< 
;<< 
}== 	
}>> 
}?? °
ÑC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Commands\ResetPasswordCommand\ResetPasswordValidator.cs
	namespace 	
Application
 
. 
Features 
. 
Users $
.$ %
Commands% -
.- .
ResetPassword. ;
{ 
public 

class "
ResetPasswordValidator '
:( )
AbstractValidator* ;
<; < 
ResetPasswordCommand< P
>P Q
{ 
public "
ResetPasswordValidator %
(% &
)& '
{		 	
RuleFor

 
(

 
property

 
=>

 
property

  (
.

( )
Email

) .
)

. /
.& '
NotEmpty' /
(/ 0
)0 1
.& '
WithMessage' 2
(2 3
MessageUserErrors3 D
.D E
NameRequaredE Q
)Q R
;R S
} 
} 
} ‘
nC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Querys\GetAllUsers\GetAllUsers.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
Users		 $
.		$ %
Querys		% +
.		+ ,
GetAllUsers		, 7
{

 
public 

class 
GetAllUsers 
: 
IRequest '
<' (
Response( 0
<0 1
List1 5
<5 6
UserDTO6 =
>= >
>> ?
>? @
{ 
} 
public 

class 
GetAlluserHandler "
:# $
IRequestHandler% 4
<4 5
GetAllUsers5 @
,@ A
ResponseB J
<J K
ListK O
<O P
UserDTOP W
>W X
>X Y
>Y Z
{ 
private 
readonly 
IRepositoryAsync )
<) *
User* .
>. /
_repositoryAsync0 @
;@ A
private 
readonly 
IMapper  
_mapper! (
;( )
public 
GetAlluserHandler  
(  !
IRepositoryAsync! 1
<1 2
User2 6
>6 7
repositoryAsync8 G
,G H
IMapperI P
mapperQ W
)W X
{ 	
_repositoryAsync 
= 
repositoryAsync .
;. /
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
Response "
<" #
List# '
<' (
UserDTO( /
>/ 0
>0 1
>1 2
Handle3 9
(9 :
GetAllUsers: E
requestF M
,M N
CancellationTokenO `
cancellationTokena r
)r s
{ 	
var 
lista 
= 
await 
_repositoryAsync .
.. /
	ListAsync/ 8
(8 9
new9 <#
GetAllUserSpecification= T
(T U
)U V
)V W
;W X
var 
result 
= 
new 
List !
<! "
UserDTO" )
>) *
(* +
)+ ,
;, -
lista 
. 
ForEach 
( 
user 
=> !
{ 
var 
userDTO 
= 
_mapper %
.% &
Map& )
<) *
UserDTO* 1
>1 2
(2 3
user3 7
)7 8
;8 9
userDTO   
.   
Edad   
=   
new   "
DateTime  # +
(  + ,
DateTime  , 4
.  4 5
Now  5 8
.  8 9
Subtract  9 A
(  A B
userDTO  B I
.  I J
DateOfBirth  J U
)  U V
.  V W
Ticks  W \
)  \ ]
.  ] ^
Year  ^ b
-  c d
$num  e f
;  f g
result!! 
.!! 
Add!! 
(!! 
userDTO!! "
)!!" #
;!!# $
}"" 
)"" 
;"" 
return## 
new## 
Response## 
<##  
List##  $
<##$ %
UserDTO##% ,
>##, -
>##- .
(##. /
result##/ 5
)##5 6
;##6 7
}$$ 	
}%% 
}&& ”
rC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Querys\GetProfileJwt\GetProfileJwt.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
Users

 $
.

$ %
Querys

% +
.

+ ,
GetProfileJwt

, 9
{ 
public 

class 
GetProfileJwt 
:  
IRequest! )
<) *
Response* 2
<2 3
UserDTO3 :
>: ;
>; <
{ 
public 
HttpContext 
HttpContext &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
GetProfileJwt 
( 
HttpContext (
httpContext) 4
)4 5
{ 	
HttpContext 
= 
httpContext %
;% &
} 	
} 
public 

class  
GetProfileJwtHandler %
:& '
IRequestHandler( 7
<7 8
GetProfileJwt8 E
,E F
ResponseG O
<O P
UserDTOP W
>W X
>X Y
{ 
private 
readonly 
IRepositoryAsync )
<) *
User* .
>. /
_repositoryAsync0 @
;@ A
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IJwtService $
_jwtService% 0
;0 1
public  
GetProfileJwtHandler #
(# $
IRepositoryAsync$ 4
<4 5
User5 9
>9 :
repositoryAsync; J
,J K
IMapperL S
mapperT Z
,Z [
IJwtService\ g

jwtServiceh r
)r s
{ 	
_repositoryAsync 
= 
repositoryAsync .
;. /
_mapper 
= 
mapper 
; 
_jwtService 
= 

jwtService $
;$ %
}   	
public"" 
async"" 
Task"" 
<"" 
Response"" "
<""" #
UserDTO""# *
>""* +
>""+ ,
Handle""- 3
(""3 4
GetProfileJwt""4 A
request""B I
,""I J
CancellationToken""K \
cancellationToken""] n
)""n o
{## 	
var$$ 
userId$$ 
=$$ 
_jwtService$$ $
.$$$ %
GetIdUserInToken$$% 5
($$5 6
request$$6 =
.$$= >
HttpContext$$> I
)$$I J
;$$J K
var%% 
user%% 
=%% 
await%% 
_repositoryAsync%% -
.%%- .
GetByIdAsync%%. :
(%%: ;
userId%%; A
)%%A B
;%%B C
var&& 
result&& 
=&& 
_mapper&&  
.&&  !
Map&&! $
<&&$ %
UserDTO&&% ,
>&&, -
(&&- .
user&&. 2
)&&2 3
;&&3 4
return'' 
new'' 
Response'' 
<''  
UserDTO''  '
>''' (
(''( )
result'') /
)''/ 0
;''0 1
}(( 	
})) 
}** ®
|C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Querys\GetUserAdmin\GetUserAccessCredentials.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
Users

 $
.

$ %
Querys

% +
.

+ ,
GetUserAdmin

, 8
{ 
public 

class $
GetUserAccessCredentials )
:* +
IRequest, 4
<4 5
Response5 =
<= >
string> D
>D E
>E F
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
public 
class +
GetUserAccessCredentialsHandler 4
:5 6
IRequestHandler7 F
<F G$
GetUserAccessCredentialsG _
,_ `
Responsea i
<i j
stringj p
>p q
>q r
{ 	
private 
readonly 
IRepositoryAsync -
<- .
User. 2
>2 3
_repositoryAsync4 D
;D E
private 
readonly 
IJwtService (
_jwtService) 4
;4 5
private 
readonly "
IEncrypPasswordService 3"
_encrypPasswordService4 J
;J K
public +
GetUserAccessCredentialsHandler .
(. /
IRepositoryAsync/ ?
<? @
User@ D
>D E
repositoryAsyncF U
,U V
IJwtServiceW b

jwtServicec m
,m n#
IEncrypPasswordService	o Ö#
encrypPasswordService
Ü õ
=
ú ù
null
û ¢
)
¢ £
{ 	
_repositoryAsync 
= 
repositoryAsync .
;. /
_jwtService 
= 

jwtService $
;$ %"
_encrypPasswordService "
=# $!
encrypPasswordService% :
;: ;
} 	
public 
async 
Task 
< 
Response "
<" #
string# )
>) *
>* +
Handle, 2
(2 3$
GetUserAccessCredentials3 K
requestL S
,S T
CancellationTokenU f
cancellationTokeng x
)x y
{ 	
var 
users 
= 
await 
_repositoryAsync .
.. /
	ListAsync/ 8
(8 9
new9 <'
GetCurrentUserSpecification= X
(X Y
requestY `
.` a
Emaila f
,f g"
_encrypPasswordServiceh ~
.~ 
Encrypt	 Ü
(
Ü á
request
á é
.
é è
Password
è ó
)
ó ò
)
ò ô
)
ô ö
;
ö õ
var   
user   
=   
users   
.   
FirstOrDefault   +
(  + ,
)  , -
;  - .
if!! 
(!! 
user!! 
==!! 
default!! 
)!!  
throw"" 
new"" 
ApiException"" &
(""& '
MessageUserErrors""' 8
.""8 9
InvalidCredentials""9 K
)""K L
;""L M
return## 
new## 
Response## 
<##  
string##  &
>##& '
(##' (
_jwtService##( 3
.##3 4
GenerateToken##4 A
(##A B
user##B F
)##F G
,##G H
MessageUserErrors##H Y
.##Y Z
TokenAuthorization##Z l
)##l m
;##n o
}$$ 	
}&& 
}'' ®
nC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Features\Users\Querys\GetUserById\GetUserById.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
Users

 $
.

$ %
Querys

% +
.

+ ,
GetUserById

, 7
{ 
public 

class 
GetUserById 
: 
IRequest '
<' (
Response( 0
<0 1
UserDTO1 8
>8 9
>9 :
{ 
public 
int 
UserId 
{ 
get 
;  
set! $
;$ %
}& '
} 
public 

class 
GetUserByIdHandler #
:$ %
IRequestHandler& 5
<5 6
GetUserById6 A
,A B
ResponseC K
<K L
UserDTOL S
>S T
>T U
{ 
private 
readonly 
IRepositoryAsync )
<) *
User* .
>. /
_repositoryAsync0 @
;@ A
private 
readonly 
IMapper  
_mapper! (
;( )
public 
GetUserByIdHandler !
(! "
IRepositoryAsync" 2
<2 3
User3 7
>7 8
repositoryAsync9 H
,H I
IMapperJ Q
mapperR X
)X Y
{ 	
_repositoryAsync 
= 
repositoryAsync .
;. /
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
Response "
<" #
UserDTO# *
>* +
>+ ,
Handle- 3
(3 4
GetUserById4 ?
request@ G
,G H
CancellationTokenI Z
cancellationToken[ l
)l m
{ 	
var
 
user 
= 
await 
_repositoryAsync +
.+ ,
GetByIdAsync, 8
(8 9
request9 @
.@ A
UserIdA G
)G H
;H I
if
 
( 
user 
== 
null 
) 
throw !
new" %
ApiException& 2
(2 3
MessageUserErrors3 D
.D E
UserNotRegisteredE V
)V W
;W X
var
 
result 
= 
_mapper 
. 
Map "
<" #
UserDTO# *
>* +
(+ ,
user, 0
)0 1
;1 2
return  
 
new   
Response   
<   
UserDTO   %
>  % &
(  & '
result  ' -
)  - .
;  . /
}!! 	
}"" 
}## ú
\C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Interfaces\IDateTimeService.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IDateTimeService %
{ 
DateTime 
NowUtc 
{ 
get 
; 
}  
} 
} Ï
ZC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Interfaces\IMessageSender.cs
	namespace 	
Shared
 
. 
Services 
{ 
public 

	interface 
IMessageSender $
{ 
Task 
< 
Response 
< 
SendGrid 
. 
Response '
?' (
>( )
>) *
	SendEmail+ 4
(4 5
string5 ;
email< A
,A B
stringC I
userNameJ R
,R S
stringT Z
subject[ b
,b c
stringd j
templetek s
)s t
;t u
} 
}		 ∑
\C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Interfaces\IRepositoryAsync.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IRepositoryAsync %
<% &
T& '
>' (
:) *
IRepositoryBase+ :
<: ;
T; <
>< =
where> C
TD E
:F G
classH M
{ 
} 
public 

	interface  
IReadRepositoryAsync )
<) *
T* +
>+ ,
:- .
IReadRepositoryBase/ B
<B C
TC D
>D E
whereF K
TL M
:N O
classP U
{		 
} 
} Ú
XC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Mappings\GeneralMapping.cs
	namespace 	
Application
 
. 
Mappings 
{ 
public 

class 
GeneralMapping 
:  !
Profile" )
{		 
public

 
GeneralMapping

 
(

 
)

 
{ 	
	CreateMap 
< 
CreateUserCommand '
,' (
User) -
>- .
(. /
)/ 0
;0 1
	CreateMap 
< 
User 
, 
UserDTO #
># $
($ %
)% &
;& '
} 	
} 
} ˚
]C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Messages\ValidationException.cs
	namespace 	
Application
 
. 
Execteptions "
{ 
public 

class 
ValidationException $
:% &
	Exception' 0
{ 
public 
ValidationException "
(" #
)# $
:% &
base' +
(+ ,
MessageErros, 8
.8 9
ValidationMessage9 J
)J K
{		 	
Errors

 
=

 
new

 
List

 
<

 
string

 $
>

$ %
(

% &
)

& '
;

' (
} 	
public 
List 
< 
string 
> 
Errors "
{# $
get% (
;( )
}* +
public 
ValidationException "
(" #
IEnumerable# .
<. /
ValidationFailure/ @
>@ A
failuresB J
)J K
:L M
thisN R
(R S
)S T
{ 	
foreach 
( 
var 
failure  
in! #
failures$ ,
), -
{ 
Errors 
. 
Add 
( 
failure "
." #
ErrorMessage# /
)/ 0
;0 1
} 
} 	
} 
} ®

aC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Messages\Validation\ApiException.cs
	namespace 	
Application
 
. 
Execteptions "
." #

Validation# -
{ 
public 

class 
ApiException 
: 
	Exception  )
{ 
public 
ApiException 
( 
) 
: 
base #
(# $
)$ %
{ 	
}		 	
public

 
ApiException

 
(

 
string

 "
message

# *
)

* +
:

, -
base

. 2
(

2 3
message

3 :
)

: ;
{ 	
} 	
public 
ApiException 
( 
string "
message# *
,* +
params, 2
object3 9
[9 :
]: ;
args< @
)@ A
:B C
baseD H
(H I
StringI O
.O P
FormatP V
(V W
CultureInfoW b
.b c
CurrentCulturec q
,q r
messager y
,y z
argsz ~
)~ 
)	 Ä
{ 	
} 	
} 
} ç
RC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\ServiceExtensions.cs
	namespace 	
Application
 
{ 
public 

static 
class 
ServiceExtensions )
{ 
public 
static 
void 
AddApplicationLayer .
(. /
this/ 3
IServiceCollection4 F
servicesG O
)O P
{ 	
services 
. 
AddAutoMapper "
(" #
Assembly# +
.+ , 
GetExecutingAssembly, @
(@ A
)A B
)B C
;C D
services 
. %
AddValidatorsFromAssembly .
(. /
Assembly/ 7
.7 8 
GetExecutingAssembly8 L
(L M
)M N
)N O
;O P
services 
. 

AddMediatR 
(  
cfg  #
=>$ &
cfg' *
.* +*
RegisterServicesFromAssemblies+ I
(I J
AssemblyJ R
.R S 
GetExecutingAssemblyS g
(g h
)h i
)i j
)j k
;k l
services 
. 
AddTransient !
(! "
typeof" (
(( )
IPipelineBehavior) :
<: ;
,; <
>< =
)= >
,> ?
typeof@ F
(F G
ValidationBehaviorG Y
<Y Z
,Z [
>[ \
)\ ]
)] ^
;^ _
services 
. 
AddTransient !
<! "
IJwtService" -
,- .

JwtService/ 9
>9 :
(: ;
); <
;< =
services 
. 
AddTransient !
<! "
IFileService" .
,. /
FileService0 ;
>; <
(< =
)= >
;> ?
services 
. 
AddTransient !
<! "
IUserSerivice" /
,/ 0
UserService1 <
>< =
(= >
)> ?
;? @
services 
. 
AddTransient !
<! "
IPasswordService" 2
,2 3
PasswordService4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! ""
IEncrypPasswordService" 8
,8 9"
EncryptPasswordService: P
>P Q
(Q R
)R S
;S T
} 	
} 
}   Œ
oC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Abstraction\FileServices\IFileService.cs
	namespace 	
Application
 
. 
Services 
. 
Abstraction *
.* +
FileServices+ 7
{ 
public 

	interface 
IFileService !
{ 
string 

UploadFile 
( 
	IFormFile #
file$ (
)( )
;) *
Task		 
<		 
FileDownloadDTO		 
>		 
DownloadFile		 *
(		* +
string		+ 1
ruta		2 6
)		6 7
;		7 8
}

 
} Æ
}C:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Abstraction\SecurityServices\IEncrypPasswordService.cs
	namespace 	
Application
 
. 
Services 
. 
Abstraction *
.* +
SecurityServices+ ;
{ 
public 

	interface "
IEncrypPasswordService +
{ 
string 
Encrypt 
( 
string 
password &
)& '
;' (
} 
} ¢
rC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Abstraction\SecurityServices\IJwtService.cs
	namespace 	
Application
 
. 
Services 
. 
Abstraction *
.* +
SecurityServices+ ;
{ 
public 

	interface 
IJwtService  
{ 
string 
GenerateToken 
( 
User !
user" &
)& '
;' (
int		 
GetIdUserInToken		 
(		 
HttpContext		 (
context		) 0
)		0 1
;		1 2
}

 
} ¶
wC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Abstraction\SecurityServices\IPasswordService.cs
	namespace 	
Application
 
. 
Services 
. 
Abstraction *
.* +
SecurityServices+ ;
{ 
public 

	interface 
IPasswordService %
{ 
string 
GeneretePassword 
(  
int  #
length$ *
)* +
;+ ,
} 
} °
qC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Abstraction\UsersServices\IUserSerivice.cs
	namespace 	
Application
 
. 
Services 
. 
Abstraction *
.* +
UsersServices+ 8
{ 
public 

	interface 
IUserSerivice "
{ 
int	 
CalcularEdad 
( 
DateTime "
fechaNacimiento# 2
)2 3
;3 4
} 
} œ!
qC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Implementation\FileServices\FileService.cs
	namespace		 	
Application		
 
.		 
Services		 
.		 
Implementation		 -
.		- .
FileServices		. :
{

 
public 

class 
FileService 
: 
IFileService +
{ 
IWebHostEnvironment 
_webHostEnvironment /
;/ 0
public 
FileService 
( 
IWebHostEnvironment .
webHostEnvironment/ A
)A B
{ 	
_webHostEnvironment 
=  !
webHostEnvironment" 4
;4 5
} 	
public 
async 
Task 
< 
FileDownloadDTO )
>) *
DownloadFile+ 7
(7 8
string8 >
ruta? C
)C D
{ 	
if 
( 
string 
. 
IsNullOrEmpty $
($ %
ruta% )
)) *
)* +
throw, 1
new2 5
ApiException6 B
(B C
MessageFileErrorsC T
.T U
RutaU Y
)Y Z
;Z [
var 
provider 
= 
new ,
 FileExtensionContentTypeProvider ?
(? @
)@ A
;A B
if 
( 
! 
provider 
. 
TryGetContentType +
(+ ,
ruta, 0
,0 1
out2 5
var6 9
contentType: E
)E F
)F G
{ 
contentType 
= 
$str 8
;8 9
} 
var 
bytes 
= 
await 
File "
." #
ReadAllBytesAsync# 4
(4 5
ruta5 9
)9 :
;: ;
return 
new 
FileDownloadDTO &
(& '
)' (
{) *
Bytes+ 0
=1 2
bytes3 8
,8 9
ContentType: E
=F G
contentTypeH S
}T U
;U V
} 	
public   
string   

UploadFile    
(    !
	IFormFile  ! *
file  + /
)  / 0
{!! 	
if"" 
("" 
file"" 
."" 
Length"" 
=="" 
$num""  
)""  !
new""" %
ApiException""& 2
(""2 3
MessageFileErrors""3 D
.""D E
ImagenRequired""E S
)""S T
;""T U
var## 
paht## 
=## 
Path## 
.## 
Combine## #
(### $
_webHostEnvironment##$ 7
.##7 8
ContentRootPath##8 G
,##G H
$str##I V
)##V W
;##W X
if%% 
(%% 
!%% 
	Directory%% 
.%% 
Exists%% !
(%%! "
paht%%" &
)%%& '
)%%' (
{&& 
	Directory'' 
.'' 
CreateDirectory'' )
('') *
paht''* .
)''. /
;''/ 0
}(( 
string** 
fullPath** 
=** 
Path** "
.**" #
Combine**# *
(*** +
paht**+ /
,**/ 0
Guid**1 5
.**5 6
NewGuid**6 =
(**= >
)**> ?
.**? @
ToString**@ H
(**H I
)**I J
+**K L
$str**M P
+**Q R
file**S W
.**W X
FileName**X `
)**` a
;**a b
using++ 
(++ 
var++ 
stream++ 
=++ 
new++  #

FileStream++$ .
(++. /
fullPath++/ 7
,++7 8
FileMode++9 A
.++A B
Create++B H
)++H I
)++I J
{,, 
file-- 
.-- 
CopyTo-- 
(-- 
stream-- "
)--" #
;--# $
}.. 
return// 
fullPath// 
;// 
}11 	
}22 
}33 Ë
ÄC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Implementation\SecurityServices\EncryptPasswordService.cs
	namespace 	
Application
 
. 
Services 
. 
Implementation -
.- .
SecurityServices. >
{ 
public 

class "
EncryptPasswordService '
:( )"
IEncrypPasswordService* @
{ 
public		 
string		 
Encrypt		 
(		 
string		 $
password		% -
)		- .
{

 	
using 
( 
var 
sha256 
= 
SHA256  &
.& '
Create' -
(- .
). /
)/ 0
{ 
byte 
[ 
] 
hashedBytes "
=# $
sha256% +
.+ ,
ComputeHash, 7
(7 8
Encoding8 @
.@ A
UTF8A E
.E F
GetBytesF N
(N O
passwordO W
)W X
)X Y
;Y Z
StringBuilder 
builder %
=& '
new( +
StringBuilder, 9
(9 :
): ;
;; <
for 
( 
int 
i 
= 
$num 
; 
i  !
<" #
hashedBytes$ /
./ 0
Length0 6
;6 7
i8 9
++9 ;
); <
{ 
builder 
. 
Append "
(" #
hashedBytes# .
[. /
i/ 0
]0 1
.1 2
ToString2 :
(: ;
$str; ?
)? @
)@ A
;A B
} 
return 
builder 
. 
ToString '
(' (
)( )
;) *
} 
} 	
} 
} ˛9
tC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Implementation\SecurityServices\JwtService.cs
	namespace 	
Application
 
. 
Services 
. 
Implementation -
.- .
SecurityServices. >
{ 
public 

class 

JwtService 
: 
IJwtService )
{ 
private 
IConfiguration 
_configuration -
;- .
private 
JwtDTO 
_jwt 
; 
public 

JwtService 
( 
IConfiguration (
configuration) 6
)6 7
{ 	
_configuration 
= 
configuration *
;* +
_jwt 
= 
_configuration !
.! "

GetSection" ,
(, -
$str- 2
)2 3
.3 4
Get4 7
<7 8
JwtDTO8 >
>> ?
(? @
)@ A
;A B
} 	
public 
string 
GenerateToken #
(# $
User$ (
user) -
)- .
{ 	
var 
claims 
= 
new 
[ 
] 
{ 
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Sub2 5
,5 6
_jwt6 :
.: ;
Subject; B
)B C
,C D
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Jti2 5
,5 6
Guid7 ;
.; <
NewGuid< C
(C D
)D E
.E F
ToStringF N
(N O
)O P
)P Q
,Q R
new   
Claim   
(   #
JwtRegisteredClaimNames   1
.  1 2
Iat  2 5
,  5 6
DateTime  7 ?
.  ? @
UtcNow  @ F
.  F G
ToString  G O
(  O P
)  P Q
)  Q R
,  R S
new!! 
Claim!! 
(!! 
$str!! "
,!!" #
user!!$ (
.!!( )
UserId!!) /
.!!/ 0
ToString!!0 8
(!!8 9
)!!9 :
)!!: ;
,!!; <
new"" 
Claim"" 
("" 
$str"" !
,""! "
user""" &
.""& '
Email""' ,
)"", -
,""- .
new## 
Claim## 
(## 
$str## $
,##$ %
user##% )
.##) *
Password##* 2
)##2 3
,##3 4
new$$ 
Claim$$ 
($$ 
$str$$ !
,$$! "
user$$" &
.$$& '
RolId$$' ,
.$$, -
ToString$$- 5
($$5 6
)$$6 7
)$$7 8
}%% 
;%% 
var&& 
key&& 
=&& 
new&&  
SymmetricSecurityKey&& .
(&&. /
Encoding&&/ 7
.&&7 8
UTF8&&8 <
.&&< =
GetBytes&&= E
(&&E F
_jwt&&F J
.&&J K
Key&&K N
)&&N O
)&&O P
;&&P Q
var'' 
credenciales'' 
='' 
new'' "
SigningCredentials''# 5
(''5 6
key''6 9
,''9 :
SecurityAlgorithms''; M
.''M N

HmacSha256''N X
)''X Y
;''Y Z
var(( 
securityToken(( 
=(( 
new((  #
JwtSecurityToken(($ 4
()) 
_jwt** 
.** 
Issuer** 
,** 
_jwt++ 
.++ 
Audience++ 
,++  
claims,, 
,,, 
expires-- 
:-- 
DateTime-- #
.--# $
Now--$ '
.--' (

AddMinutes--( 2
(--2 3
$num--3 6
)--6 7
,--7 8
signingCredentials.. $
:..$ %
credenciales..& 2
)// 
;// 
string00 
token00 
=00 
new00 #
JwtSecurityTokenHandler00 6
(006 7
)007 8
.008 9

WriteToken009 C
(00C D
securityToken00D Q
)00Q R
;00R S
return11 
token11 
;11 
}22 	
public44 
int44 
GetIdUserInToken44 #
(44# $
HttpContext44$ /
context440 7
)447 8
{55 	
string66 
token66 
=66 
context66 "
.66" #
Request66# *
.66* +
Headers66+ 2
[662 3
$str663 B
]66B C
.66C D
ToString66D L
(66L M
)66M N
.66N O
Replace66O V
(66V W
$str66W `
,66` a
$str66b d
)66d e
;66e f
if77 
(77 
string77 
.77 
IsNullOrEmpty77 $
(77$ %
token77% *
)77* +
)77+ ,
throw88 
new88 
ApiException88 &
(88& '
MessageUserErrors88' 8
.888 9
NotToken889 A
)88A B
;88B C
var99 
claims99 
=99 
validatedToken99 '
(99' (
token99( -
)99- .
;99. /
var:: 
userId:: 
=:: 
claims:: 
.::  
	FindFirst::  )
(::) *
claim::* /
=>::0 2
claim::3 8
.::8 9
Type::9 =
==::> @
$str::A I
)::I J
.::J K
Value::K P
;::P Q
return;; 
int;; 
.;; 
Parse;; 
(;; 
userId;; #
);;# $
;;;$ %
}<< 	
private>> 
ClaimsPrincipal>> 
validatedToken>>  .
(>>. /
string>>/ 5
token>>6 ;
)>>; <
{?? 	
var@@ %
tokenValidationParameters@@ )
=@@* +
new@@, /%
TokenValidationParameters@@0 I
{AA 
ValidateIssuerBB 
=BB  
falseBB! &
,BB& '
ValidateAudienceCC  
=CC! "
falseCC# (
,CC( )
IssuerSigningKeyDD  
=DD! "
newDD# & 
SymmetricSecurityKeyDD' ;
(DD; <
EncodingDD< D
.DDD E
UTF8DDE I
.DDI J
GetBytesDDJ R
(DDR S
_jwtDDS W
.DDW X
KeyDDX [
)DD[ \
)DD\ ]
,DD] ^$
ValidateIssuerSigningKeyEE (
=EE) *
trueEE+ /
,EE/ 0
ValidateLifetimeFF  
=FF! "
trueFF# '
}GG 
;GG 
varHH 
claimsPrincipalHH 
=HH  !
newHH" %#
JwtSecurityTokenHandlerHH& =
(HH= >
)HH> ?
.HH? @
ValidateTokenHH@ M
(HHM N
tokenHHN S
,HHS T%
tokenValidationParametersHHU n
,HHn o
outHHp s
varHHt w
validatedToken	HHx Ü
)
HHÜ á
;
HHá à
returnII 
claimsPrincipalII "
;II" #
}JJ 	
}KK 
}LL Û
yC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Implementation\SecurityServices\PasswordService.cs
	namespace 	
Shared
 
. 
Services 
{ 
public 

class 
PasswordService  
:! "
IPasswordService# 3
{		 
public

 
string

 
GeneretePassword

 &
(

& '
int

' *
length

+ 1
)

1 2
{ 	
const 
string 
chars 
=  
PasswordConst! .
.. /
Characteres/ :
;: ;
byte 
[ 
] 
randomBytes 
=  
new! $
byte% )
[) *
length* 0
]0 1
;1 2
using 
( 
var 
rng 
= 
new  $
RNGCryptoServiceProvider! 9
(9 :
): ;
); <
{ 
rng 
. 
GetBytes 
( 
randomBytes (
)( )
;) *
} 
StringBuilder 
passwordBuilder )
=* +
new, /
StringBuilder0 =
(= >
length> D
)D E
;E F
for 
( 
int 
i 
= 
$num 
; 
i 
< 
length  &
;& '
i( )
++) +
)+ ,
{ 
int 
index 
= 
randomBytes '
[' (
i( )
]) *
%+ ,
chars- 2
.2 3
Length3 9
;9 :
passwordBuilder 
.  
Append  &
(& '
chars' ,
[, -
index- 2
]2 3
)3 4
;4 5
} 
return 
passwordBuilder "
." #
ToString# +
(+ ,
), -
;- .
} 	
} 
}  
rC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Services\Implementation\UsersServices\UserService.cs
	namespace 	
Application
 
. 
Services 
. 
Implementation -
.- .
UsersServices. ;
{ 
public 

class 
UserService 
: 
IUserSerivice ,
{ 
public 
int 
CalcularEdad 
(  
DateTime  (
fechaNacimiento) 8
)8 9
{ 	
DateTime		 
fechaActual		  
=		! "
DateTime		# +
.		+ ,
Today		, 1
;		1 2
int

 
edad

 
=

 
fechaActual

 "
.

" #
Year

# '
-

( )
fechaNacimiento

* 9
.

9 :
Year

: >
;

> ?
if 
( 
fechaActual 
. 
Month !
<" #
fechaNacimiento$ 3
.3 4
Month4 9
||: <
(= >
fechaActual> I
.I J
MonthJ O
==P R
fechaNacimientoS b
.b c
Monthc h
&&i k
fechaActuall w
.w x
Dayx {
<| }
fechaNacimiento	~ ç
.
ç é
Day
é ë
)
ë í
)
í ì
{ 
edad 
-- 
; 
} 
return 
edad 
; 
} 	
} 
} ë
RC:\Users\Asus\source\repos\BackendProyectoPersonal\Aplication\Whappers\Response.cs
	namespace 	
Application
 
. 
Whappers 
{ 
public 

class 
Response 
< 
T 
> 
{ 
public 
Response 
( 
) 
{ 	
} 	
public		 
Response		 
(		 
T		 
data		 
,		 
string		  &
message		' .
=		/ 0
null		1 5
)		5 6
{

 	
	Succeeded 
= 
true 
; 
Message 
= 
message 
; 
Data 
= 
data 
; 
} 	
public 
Response 
( 
string 
message &
)& '
{ 	
	Succeeded 
= 
true 
; 
Message 
= 
message 
; 
} 	
public 
bool 
	Succeeded 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< 
string 
> 
Errors "
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
T 
Data 
{ 
get 
; 
set  
;  !
}" #
} 
} 