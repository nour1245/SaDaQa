abstract class AppStates {}

class AppInitial extends AppStates {}

class BottomNavBarChange extends AppStates{} 

class SphaNumberChanged extends AppStates{} 

class MushafLoading extends AppStates{} 
class MushafLoadingSucsses extends AppStates{} 
class MushafLoadingError extends AppStates{
  
} 

class RecitationsLoading extends AppStates{} 
class RecitationsLoadingSucsses extends AppStates{} 
class RecitationsLoadingError extends AppStates{
  
} 

class RecitationsSoundsLoading extends AppStates{} 
class RecitationsSoundsLoadingSucsses extends AppStates{} 
class RecitationsSoundsLoadingError extends AppStates{
  
} 
