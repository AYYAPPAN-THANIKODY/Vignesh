Feature: Automating Adactin Website
Scenario Outline: Verifying Adactin search hotel page to book a room
Given: User is on search hotel adactin web page
When User should enter login details"<username>" and "<password>" click login
Then User should enter into Search hotel page
When User should enter select "<Location>", "<Hotel>","<RoomType>","<NoOfRooms>","<CheckinDate>","<CheckoutDate>","<Adultsp>","<Child>" click search
Then User should enter into Select Hotel "SelectHotel"

Examples:
|username|password|Location|Hotel|RoomType|NoOfRooms|CheckinDate|CheckoutDate|Adultsp|Child|
|Laksh123|lak456|Melbourne|Hotel Creek|Standard|1|12/09/2021|13/09/2021|1|1|

Scenario Outline: Verifying Adactin search hotel page to enter only mandatory fields
Given: User is on search hotel adactin web page
When User should enter login details"<username>" and "<password>" click login
Then User should enter into Search hotel page
When User should enter select only "<Location>","<NoOfRooms>","<CheckinDate>","<CheckoutDate>","<Adultsp>" click search
Then User should enter into Select Hotel "SelectHotel"

Examples:
|username|password|Location|NoOfRooms|CheckinDate|CheckoutDate|Adultsp|Child|
|Laksh123|lak456|Melbourne|1|12/09/2021|13/09/2021|1|1|

Scenario Outline: Verifying Adactin search hotel page to enter only checkin date and older checkout date
Given: User is on search hotel adactin web page
When User should enter login details"<username>" and "<password>" click login
Then User should enter into Search hotel page
When User should enter select only "<CheckinDate>","<CheckoutDate>" click search
Then User should get  "Please Select a Location","Check-In Date shall be before than Check-Out Date" and "Check-Out Date shall be after than Check-In Date"

Examples:
|username|password|CheckinDate|CheckoutDate
|Laksh123|lak456|12/09/2021|12/06/2021|

Scenario Outline: Verifying Adactin search hotel page to click search without filling any fields
Given: User is on search hotel adactin web page
When User should enter login details"<username>" and "<password>" click login
Then User should enter into Search hotel page
When User should click search
Then User should get "Please Select a Location"

Examples:
|username|password|
|Laksh123|lak456|



Scenario Outline: Verifying Adactin book hotel page by entering all fields
Given: User is on book hotel adactin web page
When User should enter "<firstName>","<lastName>","<address>","<creditCardNo>","<cardType>","<expMonth>","<expYear>","<CVV>" click book now button
Then User should get order no at booking confirm

Examples:
|firstName|lastName|address|creditCardNo|cardType|expMonth|expYear|CVV|
|Ayyappan|Thanikody|123,West street|1234567891234567|VISA|1|2022|123|

Scenario Outline: Verifying Adactin book hotel page without entering any fields
Given: User is on book hotel adactin web page
When User should click book now button
Then User should get error text as "Please Enter your First Name", 
"Please Enter you Last Name","Please Enter your Address","Please Enter your 16 Digit Credit Card Number","Please Select your Credit Card Type","Please Select your Credit Card Expiry Month" and "Please Enter your Credit Card CVV Number"

Scenario Outline: Verifying book hotel adactin and booking a room
Given: User is on book hotel adactin web page
Then User should enter into Book hotel
When User should enter "<firstName>","<lastName>","<address>","<creditCardNo>","<cardType>","<expMonth>","<expYear>","<CVV>" click book now button
Then User should get order no at book confirm
When User should take the order no and click on Booked Itinery
And User should paste the booked order no and paste in Search order Id and click Go
Then User should click cancel order no

Examples:
|firstName|lastName|address|creditCardNo|cardType|expMonth|expYear|CVV|
|Ayyappan|Thanikody|123,West street|1234567891234567|VISA|1|2022|123|


Scenario Outline: Verifying Adactin booked itinerary 
Given: User is on booked itinerary  adactin web page
When User should enter order no "<orderNo>" and click Go
And User should click Cancel order no 
When User should click on Ok to clear the Alert
Then User should receive confirmation text "The booking has been cancelled."
Examples:
|orderNo|
|7VEL126QO5|
