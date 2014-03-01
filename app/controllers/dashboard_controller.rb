class DashboardController < ApplicationController
 
  def index
  end
  
  def get_data
   if params[:student_id] && !params[:student_id].blank?
    student = Student.find_by_id(params[:student_id]).assessments.last
   else
    student = Student.first.assessments.last
   end
   assessments = Classroom.first.students.map {|a| a.assessments.last}.compact
   sectionA = Student.where('classroom_id = ? && section_id = ?',1,1).map {|a| a.assessments.last}.compact 
   sectionB = Student.where('classroom_id = ? && section_id = ?',1,2).map {|a| a.assessments.last}.compact
   @class_room_result = (assessments.blank? )  ? [0, 0, 0] : [assessments.map(&:FA1).compact.reduce(:+)/assessments.map(&:FA1).count,assessments.map(&:FA2).compact.reduce(:+)/assessments.map(&:FA2).count,assessments.map(&:SA1).compact.reduce(:+)/assessments.map(&:SA1).count] 
   @sectionA =  (sectionA.blank? )  ? [0, 0, 0] : [ sectionA.map(&:FA1).compact.reduce(:+)/sectionA.map(&:FA1).count ,sectionA.map(&:FA2).compact.reduce(:+)/sectionA.map(&:FA2).count,sectionA.map(&:SA1).compact.reduce(:+)/sectionA.map(&:SA1).count]
   @sectionB = (sectionB.blank? )  ? [0, 0, 0] : [ sectionB.map(&:FA1).compact.reduce(:+)/sectionB.map(&:FA1).count ,sectionB.map(&:FA2).compact.reduce(:+)/sectionB.map(&:FA1).count,sectionB.map(&:SA1).compact.reduce(:+)/sectionB.map(&:SA1).count]
   @student = (student.blank? )  ? [0, 0, 0] : [ student.FA1, student.FA2,student.SA1]
   render :json =>{:class_room_result => @class_room_result,:sectionA => @sectionA ,:sectionB =>@sectionB,:student =>@student }
  end
 
end
