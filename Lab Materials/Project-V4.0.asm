.MODEL SMALL
.STACK 100H

.DATA
welcomeMsg1 DB '********************************************************$'
welcomeMsg2 DB '**      Welcome to CITY EVENT BOOKING SYSTEM          **$'
welcomeMsg3 DB '********************************************************$'
newline DB 13, 10, '$'    

eventCategoryMsg DB '**            EVENT CATEGORIES                     **$'
concertMsg       DB '**  [C] Concerts         - BDT 500                 **$'
sportsMsg        DB '**  [S] Sports Events    - BDT 300                 **$'
workshopMsg      DB '**  [W] Workshops        - BDT 200                 **$'
categoryEnd      DB '********************************************************$'

extrasHeader     DB '**            EXTRA OPTIONS                        **$'
parkingMsg       DB '**  [P] Parking Pass     - BDT 100                 **$'
merchandiseMsg   DB '**  [M] Merchandise      - BDT 150                 **$'
vipMsg           DB '**  [V] VIP Upgrade      - BDT 250                 **$'

promptSelectEvent DB 'Please select an event category (C/S/W): $'
promptNumTickets DB 'How many tickets do you want? (max 5): $'
promptExtras     DB 'Would you like to add extras? (Y/N): $'
promptWhichExtra DB 'Select extra (P/M/V) or X to finish: $'
promptCoupon     DB 'Do you have a coupon code? (Y/N): $'
enterCouponCode  DB 'Enter coupon code (3 characters): $'
confirmBooking   DB 'Would you like to confirm your booking? (Y/N): $'
thankyouMsg      DB 'Thank you for using City Event Booking System!$'
bookingSuccessMsg DB 'Your booking has been confirmed! Enjoy the event!$'

errorInvEvent DB 'Invalid event selection. Please try again.$'
errorTooMany DB 'Error: Maximum 5 tickets allowed per booking.$'
errorInvInput DB 'Invalid input. Please try again.$'
errorInvExtra DB 'Invalid extra selection. Please try again.$'
alreadySelectedMsg DB 'You have already selected this extra.$'

billHeader       DB '**************** YOUR BOOKING DETAILS ****************$'
eventTypeMsg     DB 'Event Type: $'
concertType      DB 'Concert$'
sportsType       DB 'Sports Event$'
workshopType     DB 'Workshop$'
numTicketsMsg    DB 'Number of tickets: $'
ticketPriceMsg   DB 'Price per ticket: BDT $'
extrasListMsg    DB 'Extras selected: $'
parkingSelected  DB 'Parking Pass, $'
merchSelected    DB 'Merchandise, $'
vipSelected      DB 'VIP Upgrade, $'
noExtrasSelected DB 'None$'
subtotalMsg      DB 'Subtotal: BDT $'
discountMsg      DB 'Group Discount (15%): BDT $'
couponDiscountMsg DB 'Coupon Discount (10%): BDT $'
totalBillMsg     DB 'TOTAL AMOUNT: BDT $'
discountApplied  DB 'Group discount of 15% applied!$'
noCouponMsg      DB 'No coupon applied.$'
invalidCouponMsg DB 'Invalid coupon code.$'
validCouponMsg   DB 'Coupon successfully applied! 10% discount.$'

eventPrices      DW 500, 300, 200    
extraPrices      DW 100, 150, 250    
digitArray       DB 5 DUP(0)         

eventType        DB ?        
eventPrice       DW 0        
numTickets       DB 0        
hasParking       DB 0        
hasMerch         DB 0        
hasVIP           DB 0        
extrasCount      DB 0        
subtotal         DW 0        
discount         DW 0        
couponDisc       DW 0        
totalBill        DW 0        
tempVar          DW 0        
couponCode       DB 3 DUP(?) 
validCoupon      DB 'EVT'    

hundreds         DB ?
tens             DB ?
ones             DB ?
thousands        DB ?
tenThousands     DB ?

divider          DB '------------------------------------------------$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    CALL PrintNewline
    LEA DX, welcomeMsg1
    CALL PrintString
    CALL PrintNewline
    LEA DX, welcomeMsg2
    CALL PrintString
    CALL PrintNewline
    LEA DX, welcomeMsg3
    CALL PrintString
    
    CALL PrintNewline
    LEA DX, eventCategoryMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, concertMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, sportsMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, workshopMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, categoryEnd
    CALL PrintString
    
EventSelection:
    CALL PrintNewline
    LEA DX, promptSelectEvent
    CALL PrintString
    
    CALL GetCharToUpper
    MOV eventType, AL
    
    CMP AL, 'C'
    JE ConcertSelected
    CMP AL, 'S'
    JE SportSelected
    CMP AL, 'W'
    JE WorkshopSelected
    
    CALL PrintNewline
    LEA DX, errorInvEvent
    CALL PrintString
    JMP EventSelection
    
ConcertSelected:
    MOV SI, 0            
    JMP GetEventPrice
    
SportSelected:
    MOV SI, 2            
    JMP GetEventPrice
    
WorkshopSelected:
    MOV SI, 4            
    JMP GetEventPrice

GetEventPrice:
    MOV AX, eventPrices[SI]  
    MOV eventPrice, AX
    JMP TicketQuantity
    
TicketQuantity:
    CALL PrintNewline
    LEA DX, promptNumTickets
    CALL PrintString
    
    MOV AH, 1       
    INT 21H
    
    SUB AL, 30H     
    MOV numTickets, AL
    
    CMP numTickets, 0
    JLE InvalidTickets
    CMP numTickets, 5
    JG TooManyTickets
    JMP ExtrasPrompt
    
InvalidTickets:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP TicketQuantity
    
TooManyTickets:
    CALL PrintNewline
    LEA DX, errorTooMany
    CALL PrintString
    JMP TicketQuantity
    
ExtrasPrompt:
    CALL PrintNewline
    
    LEA DX, extrasHeader
    CALL PrintString
    CALL PrintNewline
    LEA DX, parkingMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, merchandiseMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, vipMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, categoryEnd
    CALL PrintString
    
    CALL PrintNewline
    LEA DX, promptExtras
    CALL PrintString
    
    CALL GetCharToUpper
    
    CMP AL, 'Y'
    JE ExtrasInit
    CMP AL, 'N'
    JE CalculateBill
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ExtrasPrompt

ExtrasInit:
    MOV extrasCount, 0
    
SelectExtras:
    CMP extrasCount, 3
    JE CalculateBill   
    
    CALL PrintNewline
    LEA DX, promptWhichExtra
    CALL PrintString
    
    CALL GetCharToUpper
    
    CMP AL, 'P'
    JE AddParking
    CMP AL, 'M'
    JE AddMerchandise
    CMP AL, 'V'
    JE AddVIP
    CMP AL, 'X'
    JE CalculateBill
    
    CALL PrintNewline
    LEA DX, errorInvExtra
    CALL PrintString
    JMP SelectExtras
    
AddParking:
    CMP hasParking, 1
    JNE SetParking   
    
    CALL PrintNewline
    LEA DX, alreadySelectedMsg
    CALL PrintString
    JMP SelectExtras
    
SetParking:
    MOV hasParking, 1
    INC extrasCount
    JMP SelectExtras
    
AddMerchandise:
    CMP hasMerch, 1
    JNE SetMerchandise   
    
    CALL PrintNewline
    LEA DX, alreadySelectedMsg
    CALL PrintString
    JMP SelectExtras
    
SetMerchandise:
    MOV hasMerch, 1
    INC extrasCount
    JMP SelectExtras
    
AddVIP:
    CMP hasVIP, 1
    JNE SetVIP   
    
    CALL PrintNewline
    LEA DX, alreadySelectedMsg
    CALL PrintString
    JMP SelectExtras
    
SetVIP:
    MOV hasVIP, 1
    INC extrasCount
    JMP SelectExtras
    
CalculateBill:
    MOV AX, eventPrice
    MOV BL, numTickets
    MOV BH, 0
    MUL BX
    MOV subtotal, AX
    
    CMP hasParking, 1
    JNE CheckMerchandise
    MOV SI, 0            
    MOV AX, extraPrices[SI]
    ADD subtotal, AX
    
CheckMerchandise:
    CMP hasMerch, 1
    JNE CheckVIP
    MOV SI, 2            
    MOV AX, extraPrices[SI]
    ADD subtotal, AX
    
CheckVIP:
    CMP hasVIP, 1
    JNE CheckGroupDiscount
    MOV SI, 4            
    MOV AX, extraPrices[SI]
    ADD subtotal, AX
    
CheckGroupDiscount:
    MOV discount, 0
    
    CMP numTickets, 3
    JL CouponPrompt
    
    MOV AX, subtotal
    MOV BX, 15
    MUL BX          
    MOV BX, 100
    DIV BX          
    MOV discount, AX
    
CouponPrompt:
    CALL PrintNewline
    LEA DX, promptCoupon
    CALL PrintString
    
    CALL GetCharToUpper
    
    CMP AL, 'Y'
    JE EnterCoupon
    CMP AL, 'N'
    JE NoCouponSelected
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP CouponPrompt
    
NoCouponSelected:
    MOV couponDisc, 0    
    CALL PrintNewline
    LEA DX, noCouponMsg
    CALL PrintString
    JMP FinalizeTotal
    
EnterCoupon:
    CALL PrintNewline
    LEA DX, enterCouponCode
    CALL PrintString
    
    MOV CX, 3
    LEA SI, couponCode
    
ReadCouponLoop:
    CALL GetCharToUpper
    MOV [SI], AL
    INC SI
    LOOP ReadCouponLoop
    
    MOV CX, 3
    LEA SI, couponCode
    LEA DI, validCoupon
    
ValidateCouponLoop:
    MOV AL, [SI]
    MOV BL, [DI]
    CMP AL, BL
    JNE InvalidCoupon
    INC SI
    INC DI
    LOOP ValidateCouponLoop
    
    MOV AX, subtotal
    MOV BX, 10
    MUL BX              
    MOV BX, 100
    DIV BX              
    MOV couponDisc, AX
    
    CALL PrintNewline
    LEA DX, validCouponMsg
    CALL PrintString
    JMP FinalizeTotal
    
InvalidCoupon:
    CALL PrintNewline
    LEA DX, invalidCouponMsg
    CALL PrintString
    
    MOV couponDisc, 0
    JMP FinalizeTotal
    
FinalizeTotal:
    MOV AX, subtotal
    SUB AX, discount
    SUB AX, couponDisc
    MOV totalBill, AX
    
    CALL PrintNewline
    CALL PrintNewline
    LEA DX, billHeader
    CALL PrintString
    
    CALL PrintNewline
    LEA DX, eventTypeMsg
    CALL PrintString
    
    MOV AL, eventType
    CMP AL, 'C'
    JE DisplayConcert
    CMP AL, 'S'
    JE DisplaySports
    CMP AL, 'W'
    JE DisplayWorkshop
    
DisplayConcert:
    LEA DX, concertType
    JMP PrintEventType
    
DisplaySports:
    LEA DX, sportsType
    JMP PrintEventType
    
DisplayWorkshop:
    LEA DX, workshopType
    JMP PrintEventType
    
PrintEventType:
    CALL PrintString
    
    CALL PrintNewline
    LEA DX, numTicketsMsg
    CALL PrintString
    
    MOV DL, numTickets
    ADD DL, 30H     
    MOV AH, 2
    INT 21H
    
    CALL PrintNewline
    LEA DX, ticketPriceMsg
    CALL PrintString
    
    MOV AX, eventPrice
    CALL DisplayNumber
    
    CALL PrintNewline
    LEA DX, extrasListMsg
    CALL PrintString
    
    CALL DisplayExtras
    
DisplaySubtotal:
    CALL PrintNewline
    LEA DX, subtotalMsg
    CALL PrintString
    
    MOV AX, subtotal
    CALL DisplayNumber
    
    CMP discount, 0
    JE CheckCouponDiscount
    
    CALL PrintNewline
    LEA DX, discountApplied
    CALL PrintString
    
    CALL PrintNewline
    LEA DX, discountMsg
    CALL PrintString
    
    MOV AX, discount
    CALL DisplayNumber
    
CheckCouponDiscount:
    CMP couponDisc, 0
    JE DisplayTotal
    
    CALL PrintNewline
    LEA DX, couponDiscountMsg
    CALL PrintString
    
    MOV AX, couponDisc
    CALL DisplayNumber
    
DisplayTotal:
    CALL PrintNewline
    LEA DX, divider
    CALL PrintString
    
    CALL PrintNewline
    LEA DX, totalBillMsg
    CALL PrintString
    
    MOV AX, totalBill
    CALL DisplayNumber
    
    CALL PrintNewline
    LEA DX, divider
    CALL PrintString
    
    CALL PrintNewline
    LEA DX, confirmBooking
    CALL PrintString
    
    CALL GetCharToUpper
    
    CMP AL, 'Y'
    JE BookingConfirmed
    CMP AL, 'N'
    JE CancelBooking
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP DisplayTotal
    
BookingConfirmed:
    CALL PrintNewline
    LEA DX, bookingSuccessMsg
    CALL PrintString
    JMP ExitProgram
    
CancelBooking:
    CALL PrintNewline
    LEA DX, thankyouMsg
    CALL PrintString
    
ExitProgram:
    MOV AX, 4C00H
    INT 21H
MAIN ENDP

PrintNewline PROC
    PUSH DX
    PUSH AX
    
    LEA DX, newline
    MOV AH, 9
    INT 21H
    
    POP AX
    POP DX
    RET
PrintNewline ENDP

PrintString PROC
    PUSH AX
    
    MOV AH, 9
    INT 21H
    
    POP AX
    RET
PrintString ENDP

GetCharToUpper PROC
    PUSH BX
    
    MOV AH, 1       
    INT 21H
    
    CMP AL, 'a'
    JB NotLowerCase
    CMP AL, 'z'
    JA NotLowerCase
    SUB AL, 32      
    
NotLowerCase:
    POP BX
    RET
GetCharToUpper ENDP

DisplayExtras PROC
    PUSH AX
    PUSH BX
    PUSH DX
    
    MOV BH, 0       
    
    CMP hasParking, 1
    JNE CheckDisplayMerchandise
    LEA DX, parkingSelected
    CALL PrintString
    MOV BH, 1
    
CheckDisplayMerchandise:
    CMP hasMerch, 1
    JNE CheckDisplayVIP
    LEA DX, merchSelected
    CALL PrintString
    MOV BH, 1
    
CheckDisplayVIP:
    CMP hasVIP, 1
    JNE FinishExtrasDisplay
    LEA DX, vipSelected
    CALL PrintString
    MOV BH, 1
    
FinishExtrasDisplay:
    CMP BH, 0
    JNE DisplayExtrasDone   
    LEA DX, noExtrasSelected
    CALL PrintString
    
DisplayExtrasDone:
    POP DX
    POP BX
    POP AX
    RET
DisplayExtras ENDP

DisplayNumber PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    LEA SI, digitArray
    MOV CX, 5            
    MOV BX, 0
    
ClearDigitArray:
    MOV digitArray[BX], 0 
    INC BX
    LOOP ClearDigitArray
    
    MOV BX, 10000
    MOV DX, 0            
    DIV BX               
    MOV digitArray[0], AL 
    MOV AX, DX           
    
    MOV BX, 1000
    MOV DX, 0            
    DIV BX               
    MOV digitArray[1], AL 
    MOV AX, DX           
    
    MOV BX, 100
    MOV DX, 0            
    DIV BX               
    MOV digitArray[2], AL 
    MOV AX, DX           
    
    MOV BX, 10
    MOV DX, 0            
    DIV BX               
    MOV digitArray[3], AL 
    MOV digitArray[4], DL 
    
    MOV SI, 0            
    MOV CX, 4            
    
CheckLeadingZeros:
    CMP digitArray[SI], 0
    JNE PrintDigits      
    INC SI
    LOOP CheckLeadingZeros
    
PrintDigits:
    MOV CX, 5
    SUB CX, SI           
    
PrintLoop:
    MOV DL, digitArray[SI]
    ADD DL, 30H          
    MOV AH, 2
    INT 21H
    INC SI
    LOOP PrintLoop
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DisplayNumber ENDP

END MAIN