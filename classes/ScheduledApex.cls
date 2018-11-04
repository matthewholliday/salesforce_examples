global class ScheduledApex implements Schedulable {
   global void execute(SchedulableContext SC) {
		System.debug('SCHEDULED TASK RAN');
   }
}