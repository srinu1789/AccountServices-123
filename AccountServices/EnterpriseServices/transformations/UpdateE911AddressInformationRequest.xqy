xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $UpdateE911AddressInformationRequestType as element() (:: schema-element(ns1:updateE911AddressInformationRequest) ::) external;

declare function local:UpdateE911AddressInformationRequest($UpdateE911AddressInformationRequestType as element() (:: schema-element(ns1:updateE911AddressInformationRequest) ::)) as element() (:: schema-element(ns2:updateE911AddressInformationRequest) ::) {
    <ns2:updateE911AddressInformationRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($UpdateE911AddressInformationRequestType/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($UpdateE911AddressInformationRequestType/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($UpdateE911AddressInformationRequestType/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($UpdateE911AddressInformationRequestType/com:sourceSystem)}</com:sourceSystem>
        {
            if ($UpdateE911AddressInformationRequestType/com:language)
            then <com:language>{fn:data($UpdateE911AddressInformationRequestType/com:language)}</com:language>
            else ()
        }
        {
            if ($UpdateE911AddressInformationRequestType/ns1:esn)
            then <ns2:esn>{fn:data($UpdateE911AddressInformationRequestType/ns1:esn)}</ns2:esn>
            else ()
        }
        {
            if ($UpdateE911AddressInformationRequestType/ns1:action)
            then <ns2:action>{fn:data($UpdateE911AddressInformationRequestType/ns1:action)}</ns2:action>
            else ()
        }
        <ns2:address>
            <com:streetAddress>
                <com:line1>{fn:data($UpdateE911AddressInformationRequestType/ns1:address/com:streetAddress/com:line1)}</com:line1>
                {
                    if ($UpdateE911AddressInformationRequestType/ns1:address/com:streetAddress/com:line2)
                    then <com:line2>{fn:data($UpdateE911AddressInformationRequestType/ns1:address/com:streetAddress/com:line2)}</com:line2>
                    else ()
                }
            </com:streetAddress>
            <com:city>{fn:data($UpdateE911AddressInformationRequestType/ns1:address/com:city)}</com:city>
                  
            
            {
                if ($UpdateE911AddressInformationRequestType/ns1:address/com:state) then 
                    <com:state>{fn:data($UpdateE911AddressInformationRequestType/ns1:address/com:state)}</com:state>
                else
                    <com:nonUSState>{fn:data($UpdateE911AddressInformationRequestType/ns1:address/com:nonUSState)}</com:nonUSState>
            }
            
            
            <com:zipcode>{fn:data($UpdateE911AddressInformationRequestType/ns1:address/com:zipcode)}</com:zipcode>
        </ns2:address>
    </ns2:updateE911AddressInformationRequest>
};

local:UpdateE911AddressInformationRequest($UpdateE911AddressInformationRequestType)
