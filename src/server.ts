import express from 'express'
import morgan from 'morgan'

const app = express()
const port = process.env.PORT ?? 80

// Initialize http request logging into stdin
if (
  process.env.NODE_ENV !== 'production' &&
  process.env.NODE_ENV !== 'staging'
) {
  app.use(morgan('dev'))
} else {
  app.use(morgan('combined'))
}

// Health check route
app.get('/health', (req, res) => {
  res.send('ok')
})

// Routes
// app.use('/convert', nocache, convertRoutes)

// Start the server (Expressjs will return a Nodejs http.Server with app(express) as function param
// This will allow grace exit call

const server = app.listen(port, () => {
  console.log('App is running on port: ', port)
})

// Handling POSIX SIGNAL
const signals = ['SIGHUP', 'SIGINT', 'SIGTERM']

const shutdown = (): void => {
  console.log(`Shutting down server ...`)
  server.close(() => {
    console.log('All pending http request are returned. Shutting down process.')
    process.exit(0)
  })
}

Object.keys(signals).forEach((signal) => {
  process.on(signal, () => {
    console.log(`Process received a ${signal} signal`)
    shutdown()
  })
})
