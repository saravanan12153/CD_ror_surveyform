class StudentsController < ApplicationController
    def index

    end

    def create
        student = Student.new(name: params[:name], location: params[:location], language: params[:language], comment: params[:comment])
        if !student.valid?
            flash[:errors] = "Invalid"
            redirect_to '/'
        else
            student.save
            session[:user] = student.id
            if session[:count]
                session[:count] += 1
            else
                session[:count] = 1
            end
            flash[:success] = "Thanks for submitting this form! You have submitted this form #{session[:count]} times now."
            redirect_to '/results'
        end
    end

    def results
        @student = Student.find(session[:user])
    end

end
