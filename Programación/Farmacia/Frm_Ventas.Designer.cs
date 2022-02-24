
namespace Farmacia
{
    partial class Frm_Ventas
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.txtVendedor = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.dgvProducto = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Laboratorio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Proveedor = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Categoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Usos = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label4 = new System.Windows.Forms.Label();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.dgvDetalleProducto = new System.Windows.Forms.DataGridView();
            this.ID_Producto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Nombre_Producto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Precio_Produc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cantidad_Produc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Total_Produc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label5 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.textBox10 = new System.Windows.Forms.TextBox();
            this.textBox9 = new System.Windows.Forms.TextBox();
            this.textBox8 = new System.Windows.Forms.TextBox();
            this.textBox6 = new System.Windows.Forms.TextBox();
            this.txtCantidad = new System.Windows.Forms.TextBox();
            this.btnImprimirFactura = new System.Windows.Forms.Button();
            this.btnQuitarProduc = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.ptbBuscarProducto = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProducto)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDetalleProducto)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ptbBuscarProducto)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label1.Location = new System.Drawing.Point(51, 60);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(77, 18);
            this.label1.TabIndex = 0;
            this.label1.Text = "ID_Cliente:";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(142, 61);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(144, 22);
            this.textBox1.TabIndex = 2;
            // 
            // txtVendedor
            // 
            this.txtVendedor.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.txtVendedor.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtVendedor.Location = new System.Drawing.Point(884, 528);
            this.txtVendedor.Name = "txtVendedor";
            this.txtVendedor.Size = new System.Drawing.Size(136, 22);
            this.txtVendedor.TabIndex = 2;
            this.txtVendedor.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label3.Location = new System.Drawing.Point(793, 531);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(72, 18);
            this.label3.TabIndex = 3;
            this.label3.Text = "Vendedor:";
            // 
            // dgvProducto
            // 
            this.dgvProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvProducto.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvProducto.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgvProducto.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProducto.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.Nombre,
            this.Precio,
            this.Cantidad,
            this.Laboratorio,
            this.Proveedor,
            this.Categoria,
            this.Usos});
            this.dgvProducto.Cursor = System.Windows.Forms.Cursors.Hand;
            this.dgvProducto.Location = new System.Drawing.Point(13, 221);
            this.dgvProducto.Name = "dgvProducto";
            this.dgvProducto.Size = new System.Drawing.Size(839, 150);
            this.dgvProducto.TabIndex = 4;
            this.dgvProducto.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // ID
            // 
            this.ID.HeaderText = "ID";
            this.ID.Name = "ID";
            // 
            // Nombre
            // 
            this.Nombre.HeaderText = "Nombre";
            this.Nombre.Name = "Nombre";
            // 
            // Precio
            // 
            this.Precio.HeaderText = "Precio";
            this.Precio.Name = "Precio";
            // 
            // Cantidad
            // 
            this.Cantidad.HeaderText = "Cantidad";
            this.Cantidad.Name = "Cantidad";
            // 
            // Laboratorio
            // 
            this.Laboratorio.HeaderText = "Laboratorio";
            this.Laboratorio.Name = "Laboratorio";
            // 
            // Proveedor
            // 
            this.Proveedor.HeaderText = "Proveedor";
            this.Proveedor.Name = "Proveedor";
            // 
            // Categoria
            // 
            this.Categoria.HeaderText = "Categoria";
            this.Categoria.Name = "Categoria";
            // 
            // Usos
            // 
            this.Usos.HeaderText = "Usos";
            this.Usos.Name = "Usos";
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Sitka Small", 26.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label4.Location = new System.Drawing.Point(428, 12);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(173, 52);
            this.label4.TabIndex = 0;
            this.label4.Text = "VENTAS";
            this.label4.Click += new System.EventHandler(this.label1_Click);
            // 
            // textBox3
            // 
            this.textBox3.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox3.Location = new System.Drawing.Point(150, 172);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(136, 22);
            this.textBox3.TabIndex = 2;
            this.textBox3.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label6.Location = new System.Drawing.Point(35, 95);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(111, 18);
            this.label6.TabIndex = 0;
            this.label6.Text = "Nombre_Cliente:";
            this.label6.Click += new System.EventHandler(this.label1_Click);
            // 
            // textBox4
            // 
            this.textBox4.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox4.Location = new System.Drawing.Point(142, 95);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(254, 22);
            this.textBox4.TabIndex = 2;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label8.Location = new System.Drawing.Point(35, 172);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(113, 18);
            this.label8.TabIndex = 0;
            this.label8.Text = "Buscar Productos";
            this.label8.Click += new System.EventHandler(this.label1_Click);
            // 
            // dgvDetalleProducto
            // 
            this.dgvDetalleProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvDetalleProducto.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvDetalleProducto.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgvDetalleProducto.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDetalleProducto.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID_Producto,
            this.Nombre_Producto,
            this.Precio_Produc,
            this.Cantidad_Produc,
            this.Total_Produc});
            this.dgvDetalleProducto.Cursor = System.Windows.Forms.Cursors.Hand;
            this.dgvDetalleProducto.Location = new System.Drawing.Point(12, 400);
            this.dgvDetalleProducto.Name = "dgvDetalleProducto";
            this.dgvDetalleProducto.Size = new System.Drawing.Size(533, 150);
            this.dgvDetalleProducto.TabIndex = 8;
            this.dgvDetalleProducto.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvDetalleProducto_CellContentClick);
            // 
            // ID_Producto
            // 
            this.ID_Producto.HeaderText = "ID";
            this.ID_Producto.Name = "ID_Producto";
            // 
            // Nombre_Producto
            // 
            this.Nombre_Producto.HeaderText = "Producto";
            this.Nombre_Producto.Name = "Nombre_Producto";
            // 
            // Precio_Produc
            // 
            this.Precio_Produc.HeaderText = "Precio";
            this.Precio_Produc.Name = "Precio_Produc";
            // 
            // Cantidad_Produc
            // 
            this.Cantidad_Produc.HeaderText = "Cantidad";
            this.Cantidad_Produc.Name = "Cantidad_Produc";
            // 
            // Total_Produc
            // 
            this.Total_Produc.HeaderText = "Total";
            this.Total_Produc.Name = "Total_Produc";
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label5.Location = new System.Drawing.Point(26, 379);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(115, 18);
            this.label5.TabIndex = 9;
            this.label5.Text = "Detalle Productos";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label2.Location = new System.Drawing.Point(788, 172);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 18);
            this.label2.TabIndex = 6;
            this.label2.Text = "Cantidad";
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.label13);
            this.groupBox1.Controls.Add(this.label12);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.textBox10);
            this.groupBox1.Controls.Add(this.textBox9);
            this.groupBox1.Controls.Add(this.textBox8);
            this.groupBox1.Controls.Add(this.textBox6);
            this.groupBox1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.groupBox1.Location = new System.Drawing.Point(840, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(196, 157);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "FACTURACION";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label13.Location = new System.Drawing.Point(12, 113);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(31, 13);
            this.label13.TabIndex = 0;
            this.label13.Text = "Total";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label12.Location = new System.Drawing.Point(13, 89);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(24, 13);
            this.label12.TabIndex = 0;
            this.label12.Text = "IVS";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label11.Location = new System.Drawing.Point(12, 23);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(50, 13);
            this.label11.TabIndex = 0;
            this.label11.Text = "SubTotal";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label9.Location = new System.Drawing.Point(13, 56);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(59, 13);
            this.label9.TabIndex = 0;
            this.label9.Text = "Descuento";
            // 
            // textBox10
            // 
            this.textBox10.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox10.Location = new System.Drawing.Point(85, 79);
            this.textBox10.Name = "textBox10";
            this.textBox10.Size = new System.Drawing.Size(90, 22);
            this.textBox10.TabIndex = 2;
            // 
            // textBox9
            // 
            this.textBox9.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox9.Location = new System.Drawing.Point(85, 107);
            this.textBox9.Name = "textBox9";
            this.textBox9.Size = new System.Drawing.Size(90, 22);
            this.textBox9.TabIndex = 2;
            // 
            // textBox8
            // 
            this.textBox8.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox8.Location = new System.Drawing.Point(85, 22);
            this.textBox8.Name = "textBox8";
            this.textBox8.Size = new System.Drawing.Size(90, 22);
            this.textBox8.TabIndex = 2;
            // 
            // textBox6
            // 
            this.textBox6.Font = new System.Drawing.Font("Sitka Small", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox6.Location = new System.Drawing.Point(85, 50);
            this.textBox6.Name = "textBox6";
            this.textBox6.Size = new System.Drawing.Size(90, 22);
            this.textBox6.TabIndex = 2;
            // 
            // txtCantidad
            // 
            this.txtCantidad.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.txtCantidad.Location = new System.Drawing.Point(729, 195);
            this.txtCantidad.Name = "txtCantidad";
            this.txtCantidad.Size = new System.Drawing.Size(123, 20);
            this.txtCantidad.TabIndex = 14;
            this.txtCantidad.TextChanged += new System.EventHandler(this.txtCantidad_TextChanged);
            // 
            // btnImprimirFactura
            // 
            this.btnImprimirFactura.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnImprimirFactura.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(32)))), ((int)(((byte)(40)))));
            this.btnImprimirFactura.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnImprimirFactura.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnImprimirFactura.Image = global::Farmacia.Properties.Resources.printer_78349;
            this.btnImprimirFactura.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnImprimirFactura.Location = new System.Drawing.Point(894, 462);
            this.btnImprimirFactura.Name = "btnImprimirFactura";
            this.btnImprimirFactura.Size = new System.Drawing.Size(126, 43);
            this.btnImprimirFactura.TabIndex = 13;
            this.btnImprimirFactura.Text = "Imprimir Factura";
            this.btnImprimirFactura.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnImprimirFactura.UseVisualStyleBackColor = false;
            // 
            // btnQuitarProduc
            // 
            this.btnQuitarProduc.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnQuitarProduc.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(32)))), ((int)(((byte)(40)))));
            this.btnQuitarProduc.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQuitarProduc.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnQuitarProduc.Image = global::Farmacia.Properties.Resources.trash_can_115312;
            this.btnQuitarProduc.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnQuitarProduc.Location = new System.Drawing.Point(894, 398);
            this.btnQuitarProduc.Name = "btnQuitarProduc";
            this.btnQuitarProduc.Size = new System.Drawing.Size(126, 43);
            this.btnQuitarProduc.TabIndex = 12;
            this.btnQuitarProduc.Text = "Quitar Producto";
            this.btnQuitarProduc.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnQuitarProduc.UseVisualStyleBackColor = false;
            // 
            // btnCancelar
            // 
            this.btnCancelar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCancelar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(26)))), ((int)(((byte)(32)))), ((int)(((byte)(40)))));
            this.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCancelar.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnCancelar.Image = global::Farmacia.Properties.Resources.cancel_stop_exit_1583__1_;
            this.btnCancelar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCancelar.Location = new System.Drawing.Point(905, 328);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(98, 43);
            this.btnCancelar.TabIndex = 11;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCancelar.UseVisualStyleBackColor = false;
            // 
            // ptbBuscarProducto
            // 
            this.ptbBuscarProducto.BackgroundImage = global::Farmacia.Properties.Resources.xmag_search_find_export_locate_5984;
            this.ptbBuscarProducto.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ptbBuscarProducto.Cursor = System.Windows.Forms.Cursors.Hand;
            this.ptbBuscarProducto.Location = new System.Drawing.Point(292, 161);
            this.ptbBuscarProducto.Name = "ptbBuscarProducto";
            this.ptbBuscarProducto.Size = new System.Drawing.Size(40, 33);
            this.ptbBuscarProducto.TabIndex = 7;
            this.ptbBuscarProducto.TabStop = false;
            // 
            // Ventas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(49)))), ((int)(((byte)(66)))), ((int)(((byte)(82)))));
            this.ClientSize = new System.Drawing.Size(1048, 576);
            this.Controls.Add(this.txtCantidad);
            this.Controls.Add(this.btnImprimirFactura);
            this.Controls.Add(this.btnQuitarProduc);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.dgvDetalleProducto);
            this.Controls.Add(this.ptbBuscarProducto);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dgvProducto);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtVendedor);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "Ventas";
            this.Text = "Ventas";
            this.Load += new System.EventHandler(this.Ventas_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvProducto)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDetalleProducto)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ptbBuscarProducto)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox txtVendedor;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataGridView dgvProducto;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn Precio;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cantidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn Laboratorio;
        private System.Windows.Forms.DataGridViewTextBoxColumn Proveedor;
        private System.Windows.Forms.DataGridViewTextBoxColumn Categoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn Usos;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.PictureBox ptbBuscarProducto;
        private System.Windows.Forms.DataGridView dgvDetalleProducto;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnQuitarProduc;
        private System.Windows.Forms.Button btnImprimirFactura;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID_Producto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Nombre_Producto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Precio_Produc;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cantidad_Produc;
        private System.Windows.Forms.DataGridViewTextBoxColumn Total_Produc;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox textBox10;
        private System.Windows.Forms.TextBox textBox9;
        private System.Windows.Forms.TextBox textBox8;
        private System.Windows.Forms.TextBox textBox6;
        private System.Windows.Forms.TextBox txtCantidad;
    }
}