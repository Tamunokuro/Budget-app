class PaymentsController < ApplicationController
  before_action :authenticate_user!

  # GET /payments or /payments.json
  def index
    @payments = Group.find(params[:group_id]).payments.includes(:user).order(created_at: :desc)
    @category_id = params[:group_id]
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    group_ids = Group.select('groups.name').where(user: current_user).pluck(:id)
    @groups = Group.where(id: group_ids)
    @group_id = params[:group_id]
  end

  # POST /payments or /payments.json
  def create
    @payment = current_user.payments.build(payment_params)
    @payment.groups << Group.find_by(id: params[:group_id])

    respond_to do |format|
      if @payment.save
        format.html { redirect_to group_path(params[:group_id]), notice: 'Payment was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount, :group)
  end
end
