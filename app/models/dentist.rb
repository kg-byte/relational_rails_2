class Dentist  < ApplicationRecord
  has_many :patients
  validates_presence_of :name, :max_patient_capacity,  :hours, :rating
  validates :accepting_new_patient, inclusion: [true, false]

  def self.order_by_created_at
    order(created_at: :desc)
  end 

  def self.order_by_patients
    Dentist.find_by_sql(
      "SELECT * FROM dentists
      LEFT OUTER JOIN
      (select dentist_id, count(*) as patient_count from patients group by dentist_id)as tmp_count on(id = dentist_id)
      ORDER BY COALESCE(patient_count,0) desc;")
  end 

  def nice_date
    created_at.strftime("%Y-" "%m-" "%d")
  end

  def patient_count
    patients.count
  end

  def patients_sort
    patients.order(:name)
  end

  def patients_above_age(input)
    patients.where("age >#{input}")
  end

end