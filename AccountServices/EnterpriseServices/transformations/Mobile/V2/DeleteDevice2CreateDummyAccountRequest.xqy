xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace dd="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace cca="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../../../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace pho = "http://www.tracfone.com/PhoneCommonTypes";

declare namespace acc = "http://www.tracfone.com/AccountCommonTypes";

declare variable $deleteDeviceReq as element() (:: schema-element(dd:deleteDeviceRequest) ::) external;

declare function local:DeleteDeviceTocreateDummyAccountRequest($deleteDeviceReq as element() (:: schema-element(dd:deleteDeviceRequest) ::)) as element() (:: schema-element(cca:createAccountRequest) ::) {
    <cca:createAccountRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($deleteDeviceReq/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($deleteDeviceReq/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($deleteDeviceReq/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($deleteDeviceReq/com:sourceSystem)}</com:sourceSystem>
        {
            if ($deleteDeviceReq/com:language)
            then <com:language>{fn:data($deleteDeviceReq/com:language)}</com:language>
            else ()
        }
        {
            for $security in $deleteDeviceReq/com:security
            return 
            <com:security>
                <com:keyName>{fn:data($security/com:keyName)}</com:keyName>
                <com:keyValue>{fn:data($security/com:keyValue)}</com:keyValue>
            </com:security>
        }
        {
            if ($deleteDeviceReq/com:channel)
            then 
                if ($deleteDeviceReq/com:channel)
                then <com:channel>{fn:data($deleteDeviceReq/com:channel)}</com:channel>
                else ()
            else ()
        }
        <cca:customerName>
            <com:firstName>{fn:data($deleteDeviceReq/dd:device/pho:esn)}</com:firstName>
            <com:lastName>{fn:data($deleteDeviceReq/dd:device/pho:esn)}</com:lastName>
        </cca:customerName>
        <cca:accountCredentials>
            <acc:email>{fn:concat(fn:data($deleteDeviceReq/dd:device/pho:esn),'@totalwireless.com')}</acc:email>
            <acc:password>{fn:data($deleteDeviceReq/dd:device/pho:esn)}</acc:password>
        </cca:accountCredentials>
        <cca:address>
            <com:streetAddress>
              <com:line1>{fn:data($deleteDeviceReq/dd:device/pho:esn)}</com:line1>
              <com:line2>{fn:data($deleteDeviceReq/dd:device/pho:esn)}</com:line2>
            </com:streetAddress>
            <com:city>Miami</com:city>
            <com:zipcode>33122</com:zipcode>
            <com:countryName></com:countryName>  
            <com:state>FL</com:state>
            <com:zip>33122</com:zip>
        </cca:address>
        <cca:phoneNumber></cca:phoneNumber>
        <cca:dateOfBirth></cca:dateOfBirth>
        <cca:fourPin>0000</cca:fourPin>
        <cca:securityQuestion>{fn:data($deleteDeviceReq/dd:device/pho:esn)}</cca:securityQuestion>
        <cca:securityQuestionAnswer>{fn:data($deleteDeviceReq/dd:device/pho:esn)}</cca:securityQuestionAnswer>
        <cca:canTracfoneContactYou>true</cca:canTracfoneContactYou>
        <cca:canTracfonePartnersContactYou>true</cca:canTracfonePartnersContactYou>
        <cca:esn>{fn:data($deleteDeviceReq/dd:device/pho:esn)}</cca:esn>
        <cca:distinctContactFlag>true</cca:distinctContactFlag> 
        
    </cca:createAccountRequest>
};

local:DeleteDeviceTocreateDummyAccountRequest($deleteDeviceReq)
