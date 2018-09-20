class RenameRaterIdToJudgeIdOnRatings < ActiveRecord::Migration
  def change
    rename_column :ratings, :rater_id, :judge_id
  end
end
