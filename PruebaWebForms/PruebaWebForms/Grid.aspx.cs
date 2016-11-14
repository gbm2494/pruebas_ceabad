using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PruebaWebForms.Models;

namespace PruebaWebForms
{
    public partial class Grid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
            lblMessage.Text = "";
        }

        /// <summary>
        /// Bind Customer data to grid
        /// </summary>
        void BindGrid()
        {
            using (Entities context = new Entities())
            {
                if (context.Persona.Count() > 0)
                {
                    gridSample.DataSource = context.Persona.ToList();
                    gridSample.DataBind();
                }
                else
                {
                    var obj = new List<Persona>();
                    obj.Add(new Persona());

                    // Bind the DataTable which contain a blank row to the GridView
                    gridSample.DataSource = obj;
                    gridSample.DataBind();

                    int columnsCount = gridSample.Columns.Count;
                    gridSample.Rows[0].Cells.Clear();// clear all the cells in the row
                    gridSample.Rows[0].Cells.Add(new TableCell()); //add a new blank cell
                    gridSample.Rows[0].Cells[0].ColumnSpan = columnsCount; //set the column span to the new added cell

                    //You can set the styles here
                    gridSample.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                    gridSample.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
                    gridSample.Rows[0].Cells[0].Font.Bold = true;

                    //set No Results found to the new added cell
                    gridSample.Rows[0].Cells[0].Text = "NO RESULT FOUND!";
                }
            }
        }

        protected void gridSample_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DropDownList ddl = null;
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                ddl = e.Row.FindControl("ddlTipoNuevo") as DropDownList;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ddl = e.Row.FindControl("ddlTipo") as DropDownList;
            }
            if (ddl != null)
            {
                using (Entities context = new Entities())
                {
                    ddl.DataSource = context.tipo_persona.ToList();
                    ddl.DataTextField = "tipo";
                    ddl.DataValueField = "id";
                    ddl.DataBind();
                    ddl.Items.Insert(0, new ListItem(""));
                }
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    ddl.SelectedValue = ((Persona)(e.Row.DataItem)).tipo_persona.ToString();
                }
            }
        }


        protected void gridSample_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertNew")
            {
                GridViewRow row = gridSample.FooterRow;
                TextBox txtCedula = row.FindControl("txtCedulaNuevo") as TextBox;
                TextBox txtApe1 = row.FindControl("txtApe1Nuevo") as TextBox;
                TextBox txtApe2 = row.FindControl("txtApe2Nuevo") as TextBox;
                TextBox txtNombre = row.FindControl("txtNombreNuevo") as TextBox;
                DropDownList ddlTipo = row.FindControl("ddlTipoNuevo") as DropDownList;
                if (txtNombre != null && txtApe1 != null && txtApe2 != null && txtCedula != null && ddlTipo != null)
                {
                    using (Entities context = new Entities())
                    {
                        Persona obj = new Persona();
                        obj.cedula = txtCedula.Text;
                        obj.nombre = txtNombre.Text;
                        obj.apellido1 = txtApe1.Text;
                        obj.apellido2 = txtApe2.Text;
                        obj.tipoPersona = Convert.ToInt32(ddlTipo.SelectedValue);
                        context.Persona.Add(obj);
                        context.SaveChanges();
                        lblMessage.Text = "Añadido exitosamente.";
                        BindGrid();
                    }
                }
            }
        }

        protected void gridSample_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridSample.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void gridSample_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridSample.EditIndex = -1;
            BindGrid();
        }
        protected void gridSample_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridSample.Rows[e.RowIndex];
            TextBox txtNombre = row.FindControl("txtNombre") as TextBox;
            TextBox txtApe1 = row.FindControl("txtApe1") as TextBox;
            TextBox txtApe2 = row.FindControl("txtApe2") as TextBox;
            TextBox txtCedula = row.FindControl("txtCedula") as TextBox;
            DropDownList ddlTipo = row.FindControl("ddlTipo") as DropDownList;
            if (txtNombre != null && txtApe1 != null && txtApe2 != null && txtCedula != null && ddlTipo != null)
            {
                using (Entities context = new Entities())
                {
                    //int customerID = Convert.ToInt32(gridSample.DataKeys[e.RowIndex].Value);
                    Persona obj = context.Persona.First(x => x.cedula == txtCedula.Text);
                    obj.cedula = txtCedula.Text;
                    obj.nombre = txtNombre.Text;
                    obj.apellido1 = txtApe1.Text;
                    obj.apellido2 = txtApe2.Text;
                    obj.tipoPersona = Convert.ToInt32(ddlTipo.SelectedValue);
                    context.SaveChanges();
                    lblMessage.Text = "Salvado exitosamente.";
                    gridSample.EditIndex = -1;
                    BindGrid();
                }
            }
        }


        protected void gridSample_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //int customerID = Convert.ToInt32(gridSample.DataKeys[e.RowIndex].Value);

            //using (Entities context = new Entities())
            //{
            //    Persona obj = context.Persona.First(x => x.cedula == customerID);
            //    context.Persona.Remove(obj);
            //    context.SaveChanges();
            //    BindGrid();
            //    lblMessage.Text = "Deleted successfully.";
            //}
        }
    }
}