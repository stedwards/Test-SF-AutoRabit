<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>X24_hour_reminder</fullName>
        <description>24 hour reminder</description>
        <protected>false</protected>
        <recipients>
            <field>Attendee_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>St_Edwards_Custom/Reminder</template>
    </alerts>
</Workflow>
