#tag Class
Class NSTimeZone
Inherits NSObject
	#tag Method, Flags = &h0
		Function AbbreviationForDate(d as NSDate) As String
		  if d = nil then
		    return ""
		  end if
		  
		  #if targetMacOS
		    declare function abbreviationForDate lib CocoaLib selector "abbreviationForDate:" (obj_id as Ptr, aDate as Ptr) as CFStringRef
		    
		    return abbreviationForDate(self, d)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromAbbreviation(abbreviation as String) As NSTimeZone
		  #if targetMacOS
		    declare function timeZoneWithAbbreviation lib CocoaLib selector "timeZoneWithAbbreviation:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim tz as Ptr = timeZoneWithAbbreviation(Cocoa.NSClassFromString("NSTimeZone"), abbreviation)
		    if tz <> nil then
		      return new NSTimeZone(tz)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CreateFromName(name as String) As NSTimeZone
		  #if targetMacOS
		    declare function timeZoneWithName lib CocoaLib selector "timeZoneWithName:" (class_id as Ptr, name as CFStringRef) as Ptr
		    
		    dim tz as Ptr = timeZoneWithName(Cocoa.NSClassFromString("NSTimeZone"), name)
		    if tz <> nil then
		      return new NSTimeZone(tz)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DefaultTimeZone() As NSTimeZone
		  #if targetMacOS
		    declare function defaultTimeZone lib CocoaLib selector "defaultTimeZone" (class_id as Ptr) as Ptr
		    
		    dim tz as Ptr = defaultTimeZone(Cocoa.NSClassFromString("NSTimeZone"))
		    if tz <> nil then
		      return new NSTimeZone(tz)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub DefaultTimeZone(assigns value as NSTimeZone)
		  if value = nil then
		    return
		  end if
		  
		  
		  #if targetMacOS
		    declare sub setDefaultTimeZone lib CocoaLib selector "setDefaultTimeZone" (class_id as Ptr, tz as Ptr)
		    
		    setDefaultTimeZone(Cocoa.NSClassFromString("NSTimeZone"), value)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DSTOffsetForDate(d as NSDate) As Double
		  if d = nil then
		    return 0.0
		  end if
		  
		  #if targetMacOS
		    declare function daylightSavingTimeOffsetForDate lib CocoaLib selector "daylightSavingTimeOffsetForDate:" (obj_id as Ptr, aDate as Ptr) as Double
		    
		    return daylightSavingTimeOffsetForDate(self, d)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDSTForDate(d as NSDate) As Boolean
		  if d = nil then
		    return false
		  end if
		  
		  #if targetMacOS
		    declare function isDaylightSavingTimeForDate lib CocoaLib selector "isDaylightSavingTimeForDate:" (obj_id as Ptr, aDate as Ptr) as Boolean
		    
		    return isDaylightSavingTimeForDate(self, d)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function KnownTimeZoneNames() As String()
		  #if targetMacOS
		    declare function knownTimeZoneNames lib CocoaLib selector "knownTimeZoneNames" (class_id as Ptr) as Ptr
		    
		    dim names() as String
		    
		    dim nameArrayPtr as Ptr = knownTimeZoneNames(Cocoa.NSClassFromString("NSTimeZone"))
		    if nameArrayPtr = nil then
		      return names
		    end if
		    dim nameArray as new CFArray(nameArrayPtr, CFType.HasOwnership)
		    for i as Integer = 0 to nameArray.Count - 1
		      names.Append nameArray.CFStringRefValue(i)
		    next
		    return names
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LocalTimeZone() As NSTimeZone
		  #if targetMacOS
		    declare function localTimeZone lib CocoaLib selector "localTimeZone" (class_id as Ptr) as Ptr
		    
		    dim tz as Ptr = localTimeZone(Cocoa.NSClassFromString("NSTimeZone"))
		    if tz <> nil then
		      return new NSTimeZone(tz)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextDSTTransition() As NSDate
		  #if targetMacOS
		    declare function nextDaylightSavingTimeTransition lib CocoaLib selector "nextDaylightSavingTimeTransition" (obj_id as Ptr) as Ptr
		    
		    return new NSDate(nextDaylightSavingTimeTransition(self))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ResetSystemTimeZone() As NSTimeZone
		  #if targetMacOS
		    declare sub resetSystemTimeZone lib CocoaLib selector "resetSystemTimeZone" (class_id as Ptr)
		    
		    resetSystemTimeZone(Cocoa.NSClassFromString("NSTimeZone"))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SystemTimeZone() As NSTimeZone
		  #if targetMacOS
		    declare function systemTimeZone lib CocoaLib selector "systemTimeZone" (class_id as Ptr) as Ptr
		    
		    dim tz as Ptr = systemTimeZone(Cocoa.NSClassFromString("NSTimeZone"))
		    if tz <> nil then
		      return new NSTimeZone(tz)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function abbreviation lib CocoaLib selector "abbreviation" (obj_id as Ptr) as CFStringRef
			    
			    return abbreviation(self)
			  #endif
			End Get
		#tag EndGetter
		Abbreviation As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function description lib CocoaLib selector "description" (obj_id as Ptr) as CFStringRef
			    
			    return description(self)
			  #endif
			End Get
		#tag EndGetter
		Description As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function daylightSavingTimeOffset lib CocoaLib selector "daylightSavingTimeOffset" (obj_id as Ptr) as Double
			    
			    return daylightSavingTimeOffset(self)
			  #endif
			End Get
		#tag EndGetter
		DSTOffset As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function isDaylightSavingTime lib CocoaLib selector "isDaylightSavingTime" (obj_id as Ptr) as Boolean
			    
			    return isDaylightSavingTime(self)
			  #endif
			End Get
		#tag EndGetter
		IsDST As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function name lib CocoaLib selector "name" (obj_id as Ptr) as CFStringRef
			    
			    return name(self)
			  #endif
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function secondsFromGMT lib CocoaLib selector "secondsFromGMT" (obj_id as Ptr) as Integer
			    
			    return secondsFromGMT(self)
			  #endif
			End Get
		#tag EndGetter
		SecondsFromGMT As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Abbreviation"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DSTOffset"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDST"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SecondsFromGMT"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
