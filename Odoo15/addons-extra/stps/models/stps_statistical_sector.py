from odoo import models, fields, api


class stps(models.Model):
    _name = 'stps.statistical_sector'
    _description = 'Polígonos STPS- Estadísticas del Sector Laboral'
    _rec_name = 'statistical_sector_number'
 
    statistical_sector_number = fields.Char(string='Folio', default=lambda self: self.env['ir.sequence'].next_by_code('stps.statistical_sector'))
    year = fields.Selection(
        string='Año',
        selection=[('2021', '2021'), ('2022', '2022'),('2023', '2023')]
    )

    month = fields.Selection(
    string='Mes',
    selection=[ ('enero', 'ENERO'),
    ('febrero', 'FEBRERO'),
    ('marzo', 'MARZO'),
    ('abril', 'ABRIL'),
    ('mayo', 'MAYO'),
    ('junio', 'JUNIO'),
    ('julio', 'JULIO'),
    ('agosto', 'AGOSTO'),
    ('septiembre', 'SEPTIEMBRE'),
    ('octubre', 'OCTUBRE'),
    ('noviembre', 'NOVIEMBRE'),
    ('diciembre', 'DICIEMBRE')
    ])
    salary = fields.Float(string='Salario Mensual Libre de Impuestos')
    age = fields.Integer(string='Edad')
    gender = fields.Selection(string='Género', selection=[('M','Masculino'), ('F','Femenino')])
    state_id = fields.Many2one('stps.state', string='Estado')
    municipality_id = fields.Many2one('stps.municipality', string='Municipio')

