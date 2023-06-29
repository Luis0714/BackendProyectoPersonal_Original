ù
MC:\Users\Asus\source\repos\BackendProyectoPersonal\Shared\ServiceExtension.cs
	namespace 	
Shared
 
{ 
public 

static 
class 
ServiceExtension (
{		 
public

 
static

 
void

 $
AddSharedInfraestructure

 3
(

3 4
this

4 8
IServiceCollection

9 K
services

L T
)

T U
{ 	
services 
. 
AddTransient !
<! "
IDateTimeService" 2
,2 3
DateTimeService4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! "
IMessageEmailSender" 5
,5 6 
MessageSenderService7 K
>K L
(L M
)M N
;N O
} 	
} 
} ¢
bC:\Users\Asus\source\repos\BackendProyectoPersonal\Shared\Services\Abstraction\IDateTimeService.cs
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
} ¸
eC:\Users\Asus\source\repos\BackendProyectoPersonal\Shared\Services\Abstraction\IMessageEmailSender.cs
	namespace 	
Shared
 
. 
Services 
{ 
public 

	interface 
IMessageEmailSender )
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
}		 ù
dC:\Users\Asus\source\repos\BackendProyectoPersonal\Shared\Services\Implementation\DateTimeService.cs
	namespace 	
Shared
 
. 
Services 
. 
Implementation (
{ 
public 

class 
DateTimeService  
:! "
IDateTimeService# 3
{ 
public 
DateTime 
NowUtc 
=> !
DateTime" *
.* +
Today+ 0
;0 1
}		 
}

 ”
iC:\Users\Asus\source\repos\BackendProyectoPersonal\Shared\Services\Implementation\MessageSenderService.cs
	namespace 	
Shared
 
. 
Services 
. 
Implementation (
{ 
public		 

class		  
MessageSenderService		 %
:		& '
IMessageEmailSender		( ;
{

 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
string 
_apiKey  '
;' (
public  
MessageSenderService #
(# $
IConfiguration$ 2
configuration3 @
)@ A
{ 	
_configuration 
= 
configuration *
;* +
_apiKey 
= 
_configuration $
.$ %

GetSection% /
(/ 0
$str0 8
)8 9
.9 :
Get: =
<= >
string> D
>D E
(E F
)F G
;G H
} 	
public 
async 
Task 
< 
Response "
<" #
Response# +
?+ ,
>, -
>- .
	SendEmail/ 8
(8 9
string9 ?
email@ E
,E F
stringG M
userNameN V
,V W
stringX ^
subject_ f
,f g
stringh n
templeteo w
)w x
{ 	
var 
client 
= 
new 
SendGridClient +
(+ ,
_apiKey, 3
)3 4
;4 5
var 
from 
= 
new 
EmailAddress '
(' (

ConstEmail( 2
.2 3
	FormEmail3 <
,< =
userName> F
)F G
;G H
var 
to 
= 
new 
EmailAddress %
(% &
email& +
,+ ,
userName- 5
)5 6
;6 7
var 
plainTextContent  
=! "
$str# %
;% &
var 
msg 
= 

MailHelper  
.  !
CreateSingleEmail! 2
(2 3
from3 7
,7 8
to9 ;
,; <
subject= D
,D E
plainTextContentF V
,V W
templeteX `
)` a
;a b
var 
response 
= 
await  
client! '
.' (
SendEmailAsync( 6
(6 7
msg7 :
): ;
;; <
return 
new 
Response 
<  
Response  (
?( )
>) *
(* +
response+ 3
)3 4
;4 5
} 	
} 
} 