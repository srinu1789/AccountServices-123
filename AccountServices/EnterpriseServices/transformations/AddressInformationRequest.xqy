xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $E911AddressInformationRequestType as element() (:: schema-element(ns1:insertE911AddressInformationRequest) ::) external;

declare function local:InsertE911AddressInformationRequest($E911AddressInformationRequestType as element() (:: schema-element(ns1:insertE911AddressInformationRequest) ::)) as element() (:: schema-element(ns2:insertE911AddressInformationRequest) ::) {
    <ns2:insertE911AddressInformationRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($E911AddressInformationRequestType/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($E911AddressInformationRequestType/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($E911AddressInformationRequestType/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($E911AddressInformationRequestType/com:sourceSystem)}</com:sourceSystem>
        {
            if ($E911AddressInformationRequestType/com:language)
            then <com:language>{fn:data($E911AddressInformationRequestType/com:language)}</com:language>
            else ()
        }
        {
            if ($E911AddressInformationRequestType/ns1:esn)
            then <ns2:esn>{fn:data($E911AddressInformationRequestType/ns1:esn)}</ns2:esn>
            else ()
        }
        {
            if ($E911AddressInformationRequestType/ns1:action)
            then <ns2:action>{fn:data($E911AddressInformationRequestType/ns1:action)}</ns2:action>
            else ()
        }
        <ns2:address>
            <com:streetAddress>
                <com:line1>{fn:data($E911AddressInformationRequestType/ns1:address/com:streetAddress/com:line1)}</com:line1>
                {
                    if ($E911AddressInformationRequestType/ns1:address/com:streetAddress/com:line2)
                    then <com:line2>{fn:data($E911AddressInformationRequestType/ns1:address/com:streetAddress/com:line2)}</com:line2>
                    else ()
                }
            </com:streetAddress>
            <com:city>{fn:data($E911AddressInformationRequestType/ns1:address/com:city)}</com:city>
            {
                if ($E911AddressInformationRequestType/ns1:address/com:state) then 
                    <com:state>{fn:data($E911AddressInformationRequestType/ns1:address/com:state)}</com:state>
                else
                    <com:nonUSState>{fn:data($E911AddressInformationRequestType/ns1:address/com:nonUSState)}</com:nonUSState>
            }
            <com:zipcode>{fn:data($E911AddressInformationRequestType/ns1:address/com:zipcode)}</com:zipcode>
        </ns2:address>
    </ns2:insertE911AddressInformationRequest>
};

local:InsertE911AddressInformationRequest($E911AddressInformationRequestType)